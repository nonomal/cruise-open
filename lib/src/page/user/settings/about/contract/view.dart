import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(ContractState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      body: SafeArea(
          child: Container(child: SingleChildScrollView(child: Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0), child: Text('''修订日期：2020 年 08 月 07 日
  Tell 是一个以消解烦恼为主题的意见交换平台，由深圳谨启科技有限公司拥有和运营。当您使用 Tell 提供的服务时，即表示您（及「用户」）对本协议的任何条款均无异议并完全接受。
  本用户协议旨在协助您了解应如何使用 Tell 服务，以及在使用这些服务时应当遵守的规范。



  使用规则
  由于本产品是一个以消解烦恼为主题的意见交换平台，用户可能会在此接触到一些带有显著负面情绪或信息的书信或交谈。因此，用户必须年满 17 周岁才可以使用 Tell。若用户已满 17 周岁但不满 18 周岁，请用户在家长或监护人的陪同下仔细阅读本使用协议，并在家长或监护人书面同意下使用本产品。
  对于成年用户，我们仍建议您时刻关注心理健康。若出现沮丧失落等情绪，请及时通过适当方式消解。
  用户须对在 Tell 的注册信息的真实性、合法性、有效性承担全部责任，用户不得冒充他人；不得利用他人的名义发布任何信息；否则 Tell 有权立即停止提供服务，收回其账号并由用户独自承担由此而产生的一切法律责任。
  用户通过 Tell 发布的任何咨询、解答以及在小篝火功能中的谈话内容，均属于公开信息，其他用户或第三方均有获得这些信息的可能。因此，请勿在 Tell 产品中披露您不愿公开的信息。
  用户承诺不得以任何方式利用 Tell 从事违反中国法律及社会公德的行为，Tell 有权对违反上述承诺的内容或行为予以删除与制止。
  用户不得使用 Tell 服务制作、上传、复制、发布、传播或者转载下列内容：
  - 反对宪法所确定的基本原则的；
  - 危害国家安全，泄露国家机密，颠覆国家政权，破坏国家统一的；
  - 损害国家荣誉利益的；
  - 煽动民族仇恨、歧视，破坏民族团结的；
  - 侮辱、滥用英烈形象，否定英烈事迹，美化粉饰侵略战争行为的；
  - 宣扬恐怖主义、极端主义或者煽动实施恐怖活动、极端主义活动；
  - 破坏国家宗教政策，宣扬邪教和封建迷信的；
  - 散布谣言，扰乱社会秩序，破坏社会稳定的；
  - 不尊重 Tell 用户及其所发布内容的信息或行为，包括但不限于轻蔑、嘲讽、挑衅、歧视、诽谤、羞辱、谩骂、威胁他人的；
  - 可能引发或诱导未成年人实施不良嗜好、不安全行为、违反社会公德行为的；
  - 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；
  - 侮辱或者诽谤他人，侵害他人合法权益的；
  - 含有法律、行政法规禁止的其它内容的信息。
  Tell 有权对用户使用 Tell 的情况进行审查和监督，包括但不限于用户信息、发布内容、用户行为（小篝火、咨询、解答、举报投诉等）等范围，如用户在使用 Tell 时违反任何上述规定，Tell 或其授权的人有权要求用户改正或直接采取一切必要的措施（包括但不限于更改或删除用户发布的内容、暂停或终止用户使用 Tell 的权利）以减轻用户不当行为造成的影响。



  知识产权
  Tell 是一个信息和意见交换平台，我们尊重和鼓励用户创作的内容，认识到保护知识产权对 Tell 生存与发展的重要性，承诺将保护知识产权作为 Tell 运营的基本原则之一。
  用户在 Tell 上发布的非匿名原创内容（主要包括解答和书信），著作权均归用户本人所有。用户可授权第三方以任何方式使用，不需要得到 Tell 同意。
  用户在 Tell 上发布的匿名咨询内容，在发布时即表示同意其相关知识产权归 Tell 所有。
  Tell 提供的服务中包含的标识、版面设计、排版方式、文本、图片、图形、音频、视频等均受著作权、商标权及其它法律保护，未经相关权利人（含 Tell 及其他原始权利人）同意，上述内容均不得在任何平台被直接或间接发布、汇编、使用、出于发布或使用目的的改写、汇编或再发行，或被用于其它任何商业目的。
  在 Tell 上发布的内容，用户应保证其为著作权人或已取得合法授权，并且该内容不会侵犯任何第三方的合法权益。如果第三方提出关于著作权的异议，Tell 有权根据实际情况删除相关的内容，且有权追究用户的法律责任。给 Tell 或任何第三方造成损失的，用户应负责全部赔偿。
  如果任何第三方侵犯了 Tell 用户相关的权利，用户同意授权 Tell 或其指定的代理人代表 Tell 自身或用户对该第三方提出警告、投诉、发起行政执法、诉讼、进行上诉，或谈判和解，并且用户同意在 Tell 认为必要的情况下参与共同维权。
  Tell 有权但无义务对用户发布的内容进行审核，有权根据相关证据结合《侵权责任法》、《信息网络传播权保护条例》等法律法规对侵权信息进行处理。
  为更好地维护 Tell 生态，Tell 保留在任何时间内以任何方式处置上述由 Tell 享受所有权及知识产权的产品或内容，包括但不限于修订、屏蔽、删除或其他任何法律法规允许的处置方式。



  个人隐私
  Tell 非常重视对用户隐私的保护，并会全力保护用户的隐私信息。除法律或有法律赋予权限的政府部分要求或事先得到用户明确授权等原因外，Tell 保证不对外公开或向第三方披露用户的个人隐私信息，或用户在使用服务时存储的非公开内容。同时，为了运营和改善 Tell 的技术和服务，Tell 可能会自行收集或向第三方提供用户的非个人隐私信息，这将有助于向用户提供更好的使用体验和服务质量。
  当您使用 Tell 提供的服务时，即表示您信赖我们对您信息的处理方式。我们深知这项责任事关重大，因此会始终致力于保护您的信息，并让您享有控制权。详情请参见 Tell 《隐私政策》。



  未成年人使用条款
  Tell 非常重视对未成年人个人信息的保护。根据相关法律法规的规定，若您是 18 周岁以下的未成年人，在使用 Tell 产品前，应事先取得您的家长或法定监护人的书面同意。书面同意内容须包含未成年用户的姓名、身份证号及其家长或法定监护人的签名，同时须明确表示已知情并同意用户使用 Tell 产品。请将知情同意书进行电子扫描并发送邮件至 dz@tellers.cn。
  Tell 平台将根据用户提供的个人信息判断用户是否为未成年人。任何 17 岁以下的未成年人均不得使用 Tell 所提供的服务。
  Tell 十分重视对未成年人个人信息的保护。未成年用户在使用 Tell 服务时请谨慎披露个人隐私信息，必要时请在家长或法定监护人的指导下正确使用相关服务。
  未成年人在使用 Tell 产品时应在合理范围内正确使用网络，养成良好的上网习惯，并严格遵守《全国青少年网络文明公约》。
  如未成年用户违反本协议内容或法律法规，则用户及用户的监护人应依照法律规定承担因此而导致的一切后果。
  已满 18 周岁的成年人因任何原因不具备完全民事行为能力的，参照适用本协议之未成年人使用条款之相关约定。



  免责声明
  Tell 不能对用户发布的解答或其他内容的正确性进行保证。
  用户在 Tell 发布的内容仅表明其个人的立场和观点，并不代表 Tell 的立场和观点，Tell 亦不对其完整性、真实性、准确性、有效性或可靠性负责。用户已预知使用 Tell 提供的服务时，可能会接触到令人不悦、不适当或令人厌恶之内容。作为内容的发布者，需自行对所发表的内容负责，因所发表内容引发的一切纠纷，由该内容的发布者承担全部法律及连带责任。在任何情况下，Tell 不承担任何法律及连带责任，但 Tell 有权依法停止传输任何非正当信息并采取相应行动，包括但不限于暂停用户使用 Tell 提供的全部或部分服务，保存有关记录，并向有关机关报告等。
  Tell 不保证网络服务一定能够满足用户的要求，也不保证网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作保证。
  对于因不可抗力或 Tell 不能控制的原因造成的网络服务中断或其它缺陷，Tell 不承担任何责任，但将尽力减少因此给用户造成的损失和影响。



  用户协议的修订
  根据有关法律、法规及规范性文件的修订，或者因 Tell 发展需要，Tell 有权对本协议作出修改或变更，一旦本协议的内容发生变动，Tell 将会直接在 Tell 网站上公布修改之后的协议内容，并标明最后修订日期，该公布行为视为 Tell 已经通知用户修改内容。
  若变更导致减降用户在本协议下所享有的权利，我们会在相关服务的显著位置进行提示，或通过电子邮件、手机短信等形式向用户发送通知。'''))))));
}
