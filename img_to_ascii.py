import sys
import cv2
import numpy as np

SYMBOLS = [
    "\033[38;5;232m██\033[0m",
    "\033[38;5;237m██\033[0m",
    "\033[38;5;242m██\033[0m",
    "\033[38;5;247m██\033[0m",
    "\033[38;5;252m██\033[0m",
    "\033[97m██\033[0m"
]
THRESHOLDS = [0, 51, 102, 153, 204, 255]
def print_symbols(array):
    """change numbers to symbols"""
    len_symbols = len(SYMBOLS)
    for row in array:
        for i in row:
            print(SYMBOLS[i % len_symbols], end="")
        print("")
    
    return array

def generate_ascii(img, scale):
    """returns the numeric coded image"""
    height, width = img.shape
    new_width = int(width * scale)
    new_height = int(height * scale)

    resized_img = cv2.resize(img, (new_width, new_height))
    thresh_img = np.zeros(resized_img.shape, dtype=int)
    
    for i, threshold in enumerate(THRESHOLDS):
        thresh_img[resized_img > threshold] = i
    
    return thresh_img.astype(int)

def read_image(path):
    with open(path, 'rb') as f:
        img_data = np.frombuffer(f.read(), dtype=np.uint8)
    img = cv2.imdecode(img_data, cv2.IMREAD_GRAYSCALE)
    return img

if __name__ == "__main__":
    if len(sys.argv) == 2: 
        path = sys.argv[1]
    if len(sys.argv) == 3:
        path = sys.argv[1]
        scale = float(sys.argv[2])
    else:
        path = input("Path to image: ")
        scale = float(input("Enter scale: "))
    
    img = read_image(path)
    ascii_art = generate_ascii(img, scale)

    print_symbols(ascii_art)