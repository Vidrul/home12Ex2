
import UIKit

class ShowImageViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var imageToPresent: UIImage?
    var imageViewContentMode: UIView.ContentMode = .scaleAspectFit
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = imageToPresent
        image.contentMode = imageViewContentMode
        
    }
    
}
