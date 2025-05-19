import 'app_localizations.dart';

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  // Common
  @override
  String get appName => 'بيفاك أطلس';
  @override
  String get welcome => 'مرحباً';
  @override
  String get next => 'التالي';
  @override
  String get previous => 'السابق';
  @override
  String get skip => 'تخطي';
  @override
  String get getStarted => 'ابدأ';
  @override
  String get continueText => 'متابعة';
  @override
  String get cancel => 'إلغاء';
  @override
  String get ok => 'موافق';
  @override
  String get close => 'إغلاق';
  @override
  String get english => 'English';
  @override
  String get arabic => 'العربية';
  @override
  String get language => 'اللغة';
  @override
  String get changeLanguage => 'تغيير اللغة';

  // Onboarding
  @override
  String get onboardingTitle1 => 'مرحباً بكم في بيفاك أطلس';
  @override
  String get onboardingDesc1 => 'اكتشفوا الجمال الأصيل لجبال الأطلس في منطقة أزيلال بالمغرب.';
  @override
  String get onboardingTitle2 => 'تجارب أصيلة';
  @override
  String get onboardingDesc2 => 'اختاروا من بين أكثر من 10 أنشطة فريدة تشمل رحلات الشلالات وجولات القرى والطبخ التقليدي.';
  @override
  String get onboardingTitle3 => 'إقامة تقليدية';
  @override
  String get onboardingDesc3 => 'أقيموا في خيام بربرية أصيلة أو أكواخ خشبية صديقة للبيئة محاطة بالطبيعة.';
  @override
  String get onboardingTitle4 => 'سياحة مستدامة';
  @override
  String get onboardingDesc4 => 'ادعموا المجتمعات المحلية بينما تستمتعون بمغامرة صديقة للبيئة في الجبال.';

  // Activities
  @override
  String get chooseYourActivity => 'اختر نشاطك';
  @override
  String get selectYourAdventure => 'اختر مغامرتك';
  @override
  String get availableActivities => 'الأنشطة المتاحة';
  @override
  String get activitiesDescription => 'اختر النشاط الذي يثير اهتمامك أكثر. كل تجربة موجهة من قبل خبراء محليين.';
  @override
  String get tapToSelect => 'اضغط للاختيار';
  @override
  String get confirmSelection => 'تأكيد الاختيار';
  @override
  String get pricePerPerson => 'السعر للشخص الواحد';
  @override
  String get continueToAccommodation => 'هل تود المتابعة لاختيار أماكن الإقامة؟';

  // Activity Names
  @override
  String get waterfallHike => 'رحلة الشلالات';
  @override
  String get tajineCooking => 'تجربة طبخ الطاجين';
  @override
  String get villageTour => 'جولة القرية';
  @override
  String get mountainTrekking => 'الرحلات الجبلية';
  @override
  String get lakeExcursion => 'رحلة البحيرة';
  @override
  String get starGazing => 'ليلة مراقبة النجوم';
  @override
  String get donkeyRide => 'ركوب الحمار';
  @override
  String get handicraftWorkshop => 'ورشة الحرف اليدوية';
  @override
  String get forestPicnic => 'نزهة الغابة';
  @override
  String get caveExploration => 'استكشاف الكهوف';

  // Activity Descriptions
  @override
  String get waterfallHikeDesc => 'رحلة موجهة لاكتشاف الشلالات المذهلة حول أزيلال، مع محطات نزهة وفرص التصوير.';
  @override
  String get tajineCookingDesc => 'تعلموا كيفية طبخ الطاجين البربري التقليدي مع السكان المحليين في بيئة خارجية مريحة.';
  @override
  String get villageTourDesc => 'تجولوا في القرى الأمازيغية والتقوا بالحرفيين المحليين وتعلموا عن الحياة الجبلية الريفية.';
  @override
  String get mountainTrekkingDesc => 'مغامرة رحلة متوسطة المستوى عبر مسارات جبال الأطلس الخلابة، مثالية لمحبي الطبيعة.';
  @override
  String get lakeExcursionDesc => 'رحلة يومية إلى بحيرة بين الويدان الجميلة مع إمكانية ركوب القارب والسباحة.';
  @override
  String get starGazingDesc => 'نشاط ليلي في المخيم المفتوح لمراقبة النجوم دون تلوث ضوئي. يشمل حكايات ومشروبات دافئة.';
  @override
  String get donkeyRideDesc => 'رحلة ممتعة وآمنة للأطفال والكبار على طول مسارات الطبيعة، بإرشاد من السكان المحليين.';
  @override
  String get handicraftWorkshopDesc => 'انضموا إلى النساء المحليات في صنع السجاد والفخار أو السلال باستخدام التقنيات الأجدادية.';
  @override
  String get forestPicnicDesc => 'نزهة هادئة في منطقة حرجية مع أراجيح ووجبات خفيفة محلية وفرصة للاسترخاء.';
  @override
  String get caveExplorationDesc => 'مغامرة خفيفة في الكهوف الطبيعية لجبال الأطلس مع مرشد محلي.';

  // Accommodation
  @override
  String get chooseAccommodation => 'اختر الإقامة';
  @override
  String get selectedActivity => 'النشاط المختار';
  @override
  String get cabins => 'الأكواخ';
  @override
  String get tents => 'الخيام';
  @override
  String get perNight => 'في الليلة';
  @override
  String get available => 'متوفر';
  @override
  String get accommodationNotice => 'جميع أماكن الإقامة تشمل إفطاراً محلياً طازجاً.';
  @override
  String get continueWith => 'متابعة مع';
  @override
  String get selected => 'مختار';

  // Accommodation Names (updated with new cabins)
  @override
  String get panoramicCabin => 'كوخ صفاء الأطلس';
  @override
  String get familyCabin => 'نزل نسيم الجبل';
  @override
  String get ecoNatureCabin => 'كوخ إيكو-طبيعي';
  @override
  String get traditionalBerberTent => 'خيمة بربرية تقليدية';
  @override
  String get comfortTent => 'خيمة مريحة';

  // Accommodation Descriptions (updated with new descriptions)
  @override
  String get panoramicCabinDesc => 'كوخ أنيق مثالي للأزواج أو المسافرين المنفردين الذين يسعون للراحة والهدوء وسط الجمال الطبيعي لآيت بوغميز. يشمل سرير مزدوج فاخر، تكييف هواء، طاولة طعام صغيرة، تلفزيون، واي فاي، إفطار مجاني، وإطلالات بانورامية على الجبال والحقول المحيطة.';
  @override
  String get familyCabinDesc => 'مثالي للعائلات أو الأصدقاء الذين يسعون لملاذ جماعي في قلب الطبيعة البكر. يشمل 3 أسرة مريحة، تكييف هواء، طاولة طعام، تلفزيون، إنترنت، إفطار مجاني، وإطلالات مذهلة على وديان آيت بوغميز.';
  @override
  String get ecoNatureCabinDesc => 'أكواخ خشبية تمتزج مع الطبيعة، مصنوعة من مواد محلية صديقة للبيئة، بتصميم تقليدي دافئ.';
  @override
  String get traditionalBerberTentDesc => 'خيمة تقليدية بتصميم مستوحى من التراث البربري، تقدم لكم دفء الضيافة المغربية في بيئة طبيعية فريدة. تشمل سرير مزدوج كبير، طاولة صغيرة، إطلالة مذهلة على جبال آيت بوغميز، وإفطار مجاني.';
  @override
  String get comfortTentDesc => 'مثالية للمجموعات أو العائلات التي تسعى لتجربة تخييم مريحة وأصيلة. تشمل 3 أسرة، طاولة صغيرة، إطلالة على جبال الأطلس، وإفطار مجاني.';

  // Booking
  @override
  String get completeBooking => 'إكمال الحجز';
  @override
  String get bookingSummary => 'ملخص الحجز';
  @override
  String get chooseTripType => 'اختر نوع الرحلة';
  @override
  String get personalInformation => 'المعلومات الشخصية';
  @override
  String get stayDetails => 'تفاصيل الإقامة';
  @override
  String get fullName => 'الاسم الكامل';
  @override
  String get emailAddress => 'عنوان الإيميل';
  @override
  String get phoneNumber => 'رقم الهاتف';
  @override
  String get checkInDate => 'تاريخ الوصول';
  @override
  String get checkOutDate => 'تاريخ المغادرة';
  @override
  String get adults => 'البالغون';
  @override
  String get children => 'الأطفال';
  @override
  String get specialRequests => 'طلبات خاصة (اختيارية)';
  @override
  String get specialRequestsHint => 'أي قيود غذائية، احتياجات إمكانية وصول، إلخ.';
  @override
  String get completeBookingButton => 'إكمال الحجز';
  @override
  String get termsNotice => 'بإكمال هذا الحجز، فإنك توافق على الشروط والأحكام الخاصة بنا. سيتم إرسال إيميل تأكيد إليك بعد الإرسال مباشرة.';
  @override
  String get required => 'مطلوب';
  @override
  String get pleaseEnterName => 'يرجى إدخال اسمك الكامل';
  @override
  String get pleaseEnterEmail => 'يرجى إدخال إيميلك';
  @override
  String get pleaseEnterPhone => 'يرجى إدخال رقم هاتفك';
  @override
  String get pleaseEnterValidEmail => 'يرجى إدخال إيميل صحيح';
  @override
  String get pleaseSelectTripType => 'يرجى اختيار نوع الرحلة';

  // Trip Types
  @override
  String get luxury => 'فاخر';
  @override
  String get moderate => 'متوسط';
  @override
  String get budget => 'اقتصادي';
  @override
  String get luxuryDesc => 'تجربة راقية مع خدمات حصرية ومرشدين خاصين ووسائل راحة فاخرة';
  @override
  String get moderateDesc => 'تجربة متوازنة مع إقامة عالية الجودة وأنشطة موجهة';
  @override
  String get budgetDesc => 'تجربة أساسية تركز على الأنشطة الرئيسية والراحة الأساسية';

  // Confirmation
  @override
  String get bookingConfirmed => 'تم تأكيد الحجز!';
  @override
  String get thankYouForBooking => 'شكراً لكم لحجزكم مع بيفاك أطلس!';
  @override
  String get confirmationEmailSent => 'تم إرسال إيميل التأكيد إلى عنوان إيميلكم. سيتواصل معكم فريقنا خلال 24 ساعة لإنهاء التفاصيل.';
  @override
  String get returnToHome => 'العودة إلى الرئيسية';

  // Errors and Messages
  @override
  String get error => 'خطأ';
  @override
  String get success => 'نجح';
  @override
  String get loading => 'جاري التحميل...';
  @override
  String get noInternetConnection => 'لا يوجد اتصال بالإنترنت';
  @override
  String get tryAgain => 'حاول مرة أخرى';
}