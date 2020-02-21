

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var foundImageTextField: UITextField!
    @IBOutlet weak var contentModeSegmentControl: UISegmentedControl!
    
    let segueID = "segmentShowImage"
    let segueIDError = "notFoundImage"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func foundImageButtonDidClick(_ sender: UIButton) {
        let  textFieldText = foundImageTextField.text
        let image = UIImage(named: textFieldText!)
        if image != nil {
            self.performSegue(withIdentifier: segueID, sender: nil)
        }  else {
            self.performSegue(withIdentifier: segueIDError, sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  textFieldText = foundImageTextField.text
        if segue.identifier == segueID {
            let image = getImege()
            let contentMode = getContentMode()
            let ShowImageViewController = segue.destination as! ShowImageViewController
            ShowImageViewController.imageToPresent = image
            ShowImageViewController.imageViewContentMode = contentMode
        } else if segue.identifier == segueIDError  {
            let NotFoundInageViewController = segue.destination as! NotFoundInageViewController
            NotFoundInageViewController.notFoundlabelText = "Can not find an image with name: \(textFieldText ?? "")"
            
        }
    }
    
}



extension MainViewController {
    
    
    func getImege() -> UIImage? {
        let imageName = foundImageTextField.text!
        let image = UIImage.init(named: imageName)
        return image
    }
    
    func getContentMode () -> UIView.ContentMode {
        switch contentModeSegmentControl.selectedSegmentIndex {
        case 0:
            return .scaleToFill
        case 1:
            return .scaleAspectFit
        case 2:
            return .scaleAspectFill
        default:
            fatalError()
        }
        
    }
}
