// module_data.dart
import 'package:flutter/material.dart';

// Data model for a module
class Module {
  final String title;
  final String description;
  final String progress;
  final String image;
  final String videoUrl;

  Module({
    required this.title,
    required this.description,
    required this.progress,
    required this.image,
    required this.videoUrl,
  });
}

// Dummy static data for featured modules
final List<Module> featuredModules = [
  Module(
    title: 'Math Basics',
    description: 'Learn the basics of algebra and geometry.',
    progress: '60%',
    image: 'assets/maths.png',
    videoUrl:
        'https://github.com/migavel508/educational_videos/raw/refs/heads/main/maths1.mp4',
  ),
  Module(
    title: 'Physics Fundamentals',
    description: 'Understand the laws of motion.',
    progress: '80%',
    image: 'assets/physics.png',
    videoUrl:
        'https://github.com/migavel508/educational_videos/raw/refs/heads/main/physics.mp4',
  ),
  Module(
    title: 'Chemistry Essentials',
    description: 'Explore chemical reactions.',
    progress: '45%',
    image: 'assets/chemistry.png',
    //videoUrl: 'https://rr1---sn-ci5gup-h55l.googlevideo.com/videoplayback?expire=1727873479&ei=Z-38ZpCrOd3Qp-oPzO3AyAs&ip=102.222.233.162&id=o-ALbRAPiRe-GdNW9pPikc3xK3yivb5gYVGaYXA5jgjyDJ&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&bui=AXLXGFRIpO-KUWRx3Ya9LxMtj1-YxEoBLpQNmK5ojddNAM3ugNC338MB-CxTtCDRxc95o-XwaVdzph72&spc=54MbxZInI-VFVRYr2AQ_PevuEmba6eMcNFtb2F_FGiSWDcY9mcYW&vprv=1&svpuc=1&mime=video%2Fmp4&ns=JPVqDlttk8jzXyfLe1C63z0Q&rqh=1&gir=yes&clen=31303846&ratebypass=yes&dur=1128.768&lmt=1726238372394247&fexp=51300760&c=WEB_CREATOR&sefc=1&txp=4538434&n=exFVxHeTQR4qiA&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cbui%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cns%2Crqh%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRQIgGtPfG6bPBpzjfuYng_holshm8gdBLDjtN-4IdB50azwCIQCqej5qWSlF1QlOG-v6oGpVJ8uLm0OO9naga3kQynUZ1g%3D%3D&title=GENERAL%20CHEMISTRY%20explained%20in%2019%20Minutes&rm=sn-npupj5cax0b-3a5e7l,sn-hc5k7e&rrc=79,104&req_id=af5fbc26d450a3ee&cmsv=e&met=1727851889,&rms=rdu,rdu&redirect_counter=2&cms_redirect=yes&ipbypass=yes&mh=V0&mip=2401:4900:235c:212c:dda5:68b0:bef8:7e63&mm=29&mn=sn-ci5gup-h55l&ms=rdu&mt=1727851324&mv=u&mvi=1&pcm2cms=yes&pl=48&lsparams=ipbypass,met,mh,mip,mm,mn,ms,mv,mvi,pcm2cms,pl,rms&lsig=ABPmVW0wRgIhAK35UuWaFdxrxIBdswZiURY7XFGzoiV8b3KmG78I4p5CAiEAg4VIusBcvKpVgX28ZJdyh_rt0PQLnIagI1N4pC1jaCA%3D',
    //videoUrl: 'https://rr1---sn-ci5gup-h55l.googlevideo.com/videoplayback?expire=1727873479&ei=Z-38ZpCrOd3Qp-oPzO3AyAs&ip=102.222.233.162&id=o-ALbRAPiRe-GdNW9pPikc3xK3yivb5gYVGaYXA5jgjyDJ&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&bui=AXLXGFRIpO-KUWRx3Ya9LxMtj1-YxEoBLpQNmK5ojddNAM3ugNC338MB-CxTtCDRxc95o-XwaVdzph72&spc=54MbxZInI-VFVRYr2AQ_PevuEmba6eMcNFtb2F_FGiSWDcY9mcYW&vprv=1&svpuc=1&mime=video%2Fmp4&ns=JPVqDlttk8jzXyfLe1C63z0Q&rqh=1&gir=yes&clen=31303846&ratebypass=yes&dur=1128.768&lmt=1726238372394247&fexp=51300760&c=WEB_CREATOR&sefc=1&txp=4538434&n=exFVxHeTQR4qiA&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cbui%2Cspc%2Cvprv%2Csvpuc%2Cmime%2Cns%2Crqh%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRQIgGtPfG6bPBpzjfuYng_holshm8gdBLDjtN-4IdB50azwCIQCqej5qWSlF1QlOG-v6oGpVJ8uLm0OO9naga3kQynUZ1g%3D%3D&title=GENERAL%20CHEMISTRY%20explained%20in%2019%20Minutes&rm=sn-npupj5cax0b-3a5e7l,sn-hc5k7e&rrc=79,104&req_id=daaeee2d759da3ee&cmsv=e&met=1727869751,&rms=rdu,rdu&redirect_counter=2&cms_redirect=yes&ipbypass=yes&mh=V0&mip=2401:4900:234a:e301:957f:d9b4:3e02:9202&mm=29&mn=sn-ci5gup-h55l&ms=rdu&mt=1727869490&mv=m&mvi=1&pcm2cms=yes&pl=48&lsparams=ipbypass,met,mh,mip,mm,mn,ms,mv,mvi,pcm2cms,pl,rms&lsig=ABPmVW0wRQIgSIsrjVCifXniUj_VpD5jByTVEduZv9q5nAO8p6VCXHECIQDAaYjbpe6bY1_9vUsreV4AimHPa5P3rnRrw8pK_Kqj1w%3D%3D'
    //videoUrl: 'https://raw.githubusercontent.com/migavel508/educational_videos/refs/heads/main/chemistry.mp4'
    videoUrl: 'https://github.com/migavel508/educational_videos/raw/refs/heads/main/chemistry.mp4'
  ),
];
