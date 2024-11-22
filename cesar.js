const startCharNumber = 'А'.charCodeAt(0);
const eCharNumber = 'Е'.charCodeAt(0);
const ePlusOneCharNumber = eCharNumber + 1;
const eyoCharNumber = 'Ё'.charCodeAt(0);
const endCharNumber = 'Я'.charCodeAt(0) + 1;

function cesar(text, shift) {
    text = text.toUpperCase();
    let encryptionText = "";
    for (let i = 0; i < text.length; i++) {
        let currentCharNumber = text[i].charCodeAt(0);
        let resultChar = String.fromCharCode(currentCharNumber);
        if ((currentCharNumber >= startCharNumber && currentCharNumber < endCharNumber) || currentCharNumber == eyoCharNumber) {
            if (currentCharNumber === eyoCharNumber) currentCharNumber = ePlusOneCharNumber;
            let resultCharNumber = currentCharNumber - shift % 33;
            if (currentCharNumber >= ePlusOneCharNumber && text[i] != 'Ё' && resultCharNumber < ePlusOneCharNumber) resultCharNumber++;
            if (resultCharNumber < startCharNumber) resultCharNumber = endCharNumber - (startCharNumber - resultCharNumber);
            if (resultCharNumber === ePlusOneCharNumber && cesar(String.fromCharCode(text[i].charCodeAt(0) + 1), shift) == "Ж") resultCharNumber = eyoCharNumber;
            resultChar = String.fromCharCode(resultCharNumber);
        }
        encryptionText += resultChar;
    }
    return encryptionText;
}

function decodeCesar(text, shift) {
    shift = 33 - shift % 33;
    return cesar(text, shift);
}