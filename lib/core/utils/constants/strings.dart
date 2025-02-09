//home section
import 'package:hirelyticsinc/app/presentation/choose_us/title_description_model.dart';
import 'package:hirelyticsinc/app/presentation/choose_us/why_choose_us_card_data_model.dart';
import 'package:hirelyticsinc/app/presentation/service/service_card_info_model.dart';

import '../../../app/presentation/footer/social_button_data_model.dart';
import 'assets.dart';

const String empoweringInnovationText =
    'Empowering Innovation With Expert Tech Solutions';

const String scaleSmarterText =
    'Scale smarter, faster, and stronger with Hirelytics’ tailored tech solutions. Transform challenges into opportunities seamlessly.';

const String learnMoreText = 'Learn More';

//why choose us section
const String keyChallengesKeepingText =
    '3 Key Challenges Keeping Companies From Success';

const String atHirelyticsWeUnderstand =
    'At Hirelytics, we understand that every business encounters unique challenges in the ever-evolving tech landscape. Here are some common issues we help solve:';

const List<WhyChooseUsCardDataModel> whyChooseUsCardInfoList = [
  WhyChooseUsCardDataModel(
      icon: Assets.seoBoxPng,
      titleDescription: TitleDescriptionModel(
          title: 'Unclear ROI',
          description:
              'Are your hiring efforts yielding measurable results? We provide clarity and metrics to ensure success.')),
  WhyChooseUsCardDataModel(
    icon: Assets.announcementPng,
    titleDescription: TitleDescriptionModel(
        title: 'Standalone TA Analytics',
        description:
            'Struggling to build a robust Minimum Viable Product? We help you create scalable, tech-driven solutions.'),
  ),
  WhyChooseUsCardDataModel(
    icon: Assets.checkFilePng,
    titleDescription: TitleDescriptionModel(
        title: 'Clear Engagement Strategy',
        description:
            'A lack of structure means lost opportunities. Let us help streamline your approach for maximum impact.'),
  ),
];

const String whyHirelyticsText = 'Why Hirelytics? Here’s what Sets Us Apart';
const String atHirelyticsWeDontJustSolveProblems =
    'At Hirelytics, we don’t just solve problems – we turn your challenges into growth opportunities. Let’s align our expertise with your vision to create impactful, long-lasting solutions.';

const List<TitleDescriptionModel> whyChooseUseReasonList = [
  TitleDescriptionModel(
      title: 'Real-Time Insights',
      description:
          'Access actionable hiring data to make faster, smarter decisions.'),
  TitleDescriptionModel(
      title: 'Custom Solutions',
      description:
          'Tailored, job-by-job assistance designed to meet your needs.'),
  TitleDescriptionModel(
      title: 'Market Feedback',
      description:
          'Leverage ad hoc reports to inform strategic hiring decisions.'),
];

// service section
const String top3SolutionToYourProblem = 'Top 3 Solutions To Your Problems';
const List<ServiceCardInfoModel> serviceCardInfoList = [
  ServiceCardInfoModel(
      titleDescription: TitleDescriptionModel(
          title: 'Access to a Skilled Talent Pool',
          description:
              'Say goodbye to lengthy hiring processes. Our vast network of pre-vetted tech professionals ensures you find the perfect talent quickly and efficiently.'),
      image: Assets.serviceImage1),
  ServiceCardInfoModel(
      titleDescription: TitleDescriptionModel(
          title: 'Customized Scalability Strategies',
          description:
              'Whether you’re scaling up or streamlining operations, we design flexible, tech-driven strategies that optimize performance while keeping costs in check.'),
      image: Assets.serviceImage2),
  ServiceCardInfoModel(
      titleDescription: TitleDescriptionModel(
          title: 'Future-Proof Tech Insights',
          description:
              'Stay ahead in the competitive tech landscape with our expert guidance on emerging technologies, trends, and tools tailored to your industry needs.'),
      image: Assets.serviceImage3),
];

const String readyToSolveYourChallenges =
    'Ready to solve your challenges?\nLet us create a roadmap for success, personalized for your business.';

// about us section
const String aboutUsText = 'About Us';
const String atHirelyticsWeAreDedicatedTo =
    'At Hirelytics, we are dedicated to helping businesses unlock their potential through innovative tech solutions and expert guidance. Our team of professionals brings a wealth of experience in technology, strategy, and innovation, ensuring tailored solutions that drive success. Whether it’s finding the right talent, scaling operations, or staying ahead of industry trends, we are here to turn your challenges into opportunities. With a commitment to excellence and a passion for innovation, Hirelytics is your trusted partner for all things tech.';
const String meetTheTeam = 'Meet The Team';
const String viewBioText = 'View Bio';


//blog section
const String latestBlogPosts = 'Latest Blog Posts';
const String noBlogsFound = 'No Blogs Found';

// contact us section
const String contactUsText = 'Contact Us';
const String emailText = 'Email';
const String phoneText = 'Phone';
const String locationText = 'Location';
const String sendUsAMessageText = 'Send Us A Message';
const String firstNameText = 'First Name';
const String lastNameText = 'Last Name';
const String messageText = 'Message';
const String submitButtonText = 'Submit';

// footer section
const String connectText = 'Connect';
const List<SocialButtonDataModel> socialButtonDataList = [
  SocialButtonDataModel(
      title: 'Facebook', iconPath: Assets.socialFacebookSvg, url: 'https://www.facebook.com/hirelyticsinc/'),
  SocialButtonDataModel(
      title: 'Instagram', iconPath: Assets.socialInstagramSvg, url: 'https://www.instagram.com/hirelyticsinc/'),
  SocialButtonDataModel(
      title: 'Twitter/X', iconPath: Assets.socialTwitterOrXSvg, url: 'https://x.com/hirelyticsinc'),
  SocialButtonDataModel(
      title: 'Linkedin', iconPath: Assets.socialLinkedinSvg, url: 'https://www.linkedin.com/company/hirelyticstech/'),
];

const String organizationContactAddress =
    '6 Liberty Square #6055 Boston, MA 02109';
const String organizationLocationMapUrl =
    'https://maps.app.goo.gl/kvFq6pBTBuNVXrAH6';
const String organizationContactPhone1 = '(617) 469-9779';
const String organizationContactPhone2 = '(617) 363-0091';
const String organizationContactEmail = 'contact@hirelyticsinc.com';
const String copyrightText = '© Hirelytics 2025';
const String developedByText = 'Developed By';
const String supreoXText = 'SupreoX';
const String supreoXWebsiteUrlText = 'https://supreox.com';
