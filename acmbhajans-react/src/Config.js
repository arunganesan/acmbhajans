export function URLBASE () {    
    if (!process.env.NODE_ENV || process.env.NODE_ENV === 'development') {
        return 'http://ammacentermichigan.com:1234';
    } else {
        return 'https://ammacentermichigan.com/rails';
    }
}

export const BASEDIR = 'bhajans';
