const String defaultAnimal = 'tiger';
////////////////////////////////////////////////////////
/// Unsplash Constants
////////////////////////////////////////////////////////
const String unsplashExampleUrl =
    'https://api.unsplash.com/search/photos?page=1&per_page=1&client_id=PM6_4-e3QYP4jcMsESTo8uD4rVqyAvBLOWo_tYbqUf4&query=turtle';

const String unsplashBaseUrl =
    'https://api.unsplash.com/search/photos?page=1&per_page=1';
const String unsplashId =
    "&client_id=PM6_4-e3QYP4jcMsESTo8uD4rVqyAvBLOWo_tYbqUf4";

const String unsplashFinalUrl = '$unsplashBaseUrl$unsplashId&query=';

////////////////////////////////////////////////////////
/// Wolfram Constants
////////////////////////////////////////////////////////
const String wolframShortAnswerUrl =
    'https://api.wolframalpha.com/v1/result?appid=WJ4X2W-X65E92VXAQ&i=age+';
const String exampleWolframUrl =
    'https://api.wolframalpha.com/v2/query?appid=WJ4X2W-X65E92VXAQ&includepodid=Result&format=plaintext&output=json&input=age+ant';

const String wolframBaseUrl = 'https://api.wolframalpha.com/v2/query?';
const String appID = 'appid=WJ4X2W-X65E92VXAQ';
const String podID = '&includepodid=Result';
const String format = '&format=plaintext';
const String output = '&output=json';
const String input = '&input=lifespan+';
const String wolframFinalUrl =
    '$wolframBaseUrl$appID$podID$format$output$input';
