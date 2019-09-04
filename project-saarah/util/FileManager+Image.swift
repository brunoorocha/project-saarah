//
//  FileManager+Image.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

enum FileImageExtension: String {
    case jpg = ".jpg"
    case png = ".png"
}

struct DocumentsDirectory {

    private init() {}

    /// Try to save the image on fileManager
    ///
    /// - Parameters:
    ///   - data: data is UIImage
    ///   - name: name of file
    /// - Returns: return the file path to save if necessery.
    static func saveFile(with data: Data, and name: String) -> URL? {
        guard let documentsUrl = DocumentsDirectory.getDirectoryUrl() else { return nil }
        let filePath = documentsUrl.appendingPathComponent(name)
        if !FileManager.default.fileExists(atPath: filePath.path) {
            do {
                try data.write(to: filePath)
                print("Image saved with successfully")
            } catch {
                print(error.localizedDescription)
            }
        }

        return filePath
    }

    static func saveFile(with image: UIImage, and name: String, extension imageExtension: FileImageExtension) -> URL? {
        let completeName = "\(name)\(imageExtension.rawValue)"

        var data: Data
        switch imageExtension {
        case .jpg:
            data = image.jpegData(compressionQuality: 1.0)!
        case .png:
            data = image.pngData()!
        }

        return saveFile(with: data, and: completeName)
    }

    static func saveFile(with data: Data, and name: String, extension imageExtension: FileImageExtension) -> URL? {
        let completeName = "\(name)\(imageExtension.rawValue)"
        return saveFile(with: data, and: completeName)
    }

    /// The image can be found by name
    ///
    /// - Parameters:
    ///   - name: The name of the file
    ///   - extesion: Type of extesion : jpg, png ...
    static func getImage(by name: String, extension imageExtension: FileImageExtension) -> UIImage? {
        return getImage(with: "\(name)\(imageExtension.rawValue)")
    }

    /// If the image has saved with extension, dont need pass again it.
    ///
    /// - Parameter name: The name of the file with extension
    /// - Returns: Return the image if exists.
    static func getImage(by name: String) -> UIImage? {
        guard let documentsUrl = DocumentsDirectory.getDirectoryUrl() else { return nil }
        let imagePath = documentsUrl.appendingPathComponent(name)

        if FileManager.default.fileExists(atPath: imagePath.path) {
            guard let imageData = FileManager.default.contents(atPath: imagePath.path) else {
                return nil
            }

            return UIImage(data: imageData)
        }

        return nil
    }

    /// If know the path can try to found with that.
    ///
    /// - Parameter path: Path value
    /// - Returns: return the image if exists.
    static func getImage(with path: String) -> UIImage? {
        if FileManager.default.fileExists(atPath: path) {
            guard let imageData = FileManager.default.contents(atPath: path) else {
                return nil
            }

            return UIImage(data: imageData)
        }

        return nil
    }

    /// Get filemanager URL to save and load data
    ///
    /// - Returns: URL from FileManager to Read/Write.
    private static func getDirectoryUrl() -> URL? {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)

        return URL(fileURLWithPath: paths[0])
    }

    /// Will check on fileManager if has this path saved
    ///
    /// - Parameter path: path of the new file
    /// - Returns: boolean - true to has saved.
    private static func fileExists(at path: String) -> Bool {
        return FileManager.default.fileExists(atPath: path)
    }

}
