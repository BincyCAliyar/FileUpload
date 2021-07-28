//
//  FileUploadViewController.swift
//  File Upload
//
//  Created by Sijo Thadathil on 28/07/21.
//

import UIKit
import Alamofire

class FileUploadViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myUploadBtn: UIButton!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var licenseNumber: UILabel!
    var uploadData:DataClass?
    @IBOutlet weak var ISSlbl: UILabel!
    @IBOutlet weak var dobLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var endLbl: UILabel!
    
    @IBOutlet weak var restrictionLbl: UILabel!
    @IBOutlet weak var licTypeLbl: UILabel!
    @IBOutlet weak var eyesLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var sexLbl: UILabel!
    @IBOutlet weak var doeLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.isHidden = true
       
    }
    

   
    @IBAction func uploadButtonClicked(_ sender: Any)
    {
        let imagePickerController  = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a Source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action:UIAlertAction) in imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action:UIAlertAction) in imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                              self.present(actionSheet, animated: true, completion: nil)
        
       // imagePickerController.delegate = self
        
//        present(imagePickerController, animated: true, completion: nil)
//    }
    }
//
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            myImageView.contentMode = .scaleAspectFit
            myImageView.image = image
            print(image)
        }
        myUploadBtn.isHidden = true
        
        dismiss(animated: true, completion: nil)
        apiCall()
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func apiCall()
    {
        let image = UIImage(named: "SampleImage")
        let url = "https://oneteam-ocr-cxcwh75dea-uc.a.run.app/fetch_data"
        let headers: HTTPHeaders = [
                /* "Authorization": "your_access_token",  in case you need authorization header */
                "Content-type": "multipart/form-data"
            ]


                AF.upload(
                    multipartFormData: { multipartFormData in
                        multipartFormData.append(image!.jpegData(compressionQuality: 0.5)!, withName: "file" , fileName: "2.jpeg", mimeType: "image/jpeg")
                },
                    to: url, method: .post , headers: headers)
                    .responseJSON {
                        response in
        switch response.result
        {
        case .success:
            print(response)
            if let jsonData = response.data
            {
                self.myView.isHidden = false
                 let responseObject = try? JSONDecoder().decode(Welcome.self, from: jsonData)
                 print(responseObject!)
                self.myImageView.isHidden = true
                self.licenseNumber.text = responseObject?.data?.licenseNo
                self.ISSlbl.text = responseObject?.data?.iss
               // self.dobLbl.text = responseObject?.data?.dob
                self.nameLbl.text = responseObject?.data?.name
                self.addressLbl.text = responseObject?.data?.address
                self.sexLbl.text = responseObject?.data?.gender
                self.heightLbl.text = responseObject?.data?.height
                self.eyesLbl.text = responseObject?.data?.eyes
                self.licTypeLbl.text = responseObject?.data?.licenseNo
                self.endLbl.text = responseObject?.data?.end
                self.restrictionLbl.text = responseObject?.data?.restriction
                }
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
                    }
        
    }

    }
