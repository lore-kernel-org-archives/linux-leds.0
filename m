From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v2 2/2] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Mon, 18 Dec 2017 13:31:38 +0000
Message-ID: <20171218133138.smvnucfm44bgmdpw@oak.lan>
References: <20171116141151.21171-1-enric.balletbo@collabora.com>
 <20171116141151.21171-3-enric.balletbo@collabora.com>
 <20171215145120.2d2o33tqlechp45h@oak.lan>
 <CAFqH_50Jqs5_5n7D019_ZxvQD1FPCZAYhaLunNm6qzj_cH3tiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFqH_50Jqs5_5n7D019_ZxvQD1FPCZAYhaLunNm6qzj_cH3tiw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandru Stan <amstan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Dec 18, 2017 at 11:27:22AM +0100, Enric Balletbo Serra wrote:
> Hi Daniel,
> 
> 2017-12-15 15:51 GMT+01:00 Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> > On Thu, Nov 16, 2017 at 03:11:51PM +0100, Enric Balletbo i Serra wrote:
> >> When you want to change the brightness using a PWM signal, one thing you
> >> need to consider is how human perceive the brightness. Human perceive the
> >> brightness change non-linearly, we have better sensitivity at low
> >> luminance than high luminance, so to achieve perceived linear dimming, the
> >> brightness must be matches to the way our eyes behave. The CIE 1931
> >> lightness formula is what actually describes how we perceive light.
> >>
> >> This patch adds support to compute the brightness levels based on a static
> >> table filled with the numbers provided by the CIE 1931 algorithm, for now
> >> it only supports PWM resolutions up to 65535 (16 bits) with 1024 steps.
> >> Lower PWM resolutions are implemented using the same curve but with less
> >> steps, e.g. For a PWM resolution of 256 (8 bits) we have 37 steps.
> >>
> >> The calculation of the duty cycle using the CIE 1931 algorithm is enabled by
> >> default when you do not define the 'brightness-levels' propriety in your
> >> device tree.
> >>
> >> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> >> ---
> >>  drivers/video/backlight/pwm_bl.c | 160 +++++++++++++++++++++++++++++++++++----
> >>  include/linux/pwm_backlight.h    |   1 +
> >>  2 files changed, 147 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> >> index 59b1bfb..ea96358 100644
> >> --- a/drivers/video/backlight/pwm_bl.c
> >> +++ b/drivers/video/backlight/pwm_bl.c
> >> @@ -26,6 +26,112 @@
> >>
> >>  #define NSTEPS       256
> >>
> >> +/*
> >> + * CIE lightness to PWM conversion table. The CIE 1931 lightness formula is what
> >> + * actually describes how we perceive light:
> >> + *
> >> + *          Y = (L* / 902.3)           if L* ≤ 0.08856
> >> + *          Y = ((L* + 16) / 116)^3    if L* > 0.08856
> >> + *
> >> + * Where Y is the luminance (output) between 0.0 and 1.0, and L* is the
> >> + * lightness (input) between 0 and 100.
> >> + */
> >> +const unsigned int cie1931_table[1024] = {
> >
> > I'm a little surprised to see such a large table. I thought we'd be able
> > to use the linear interpolation logic to smooth a smaller table.
> >
> 
> oh, I didn't catch that you wanted use linear interpolation for that
> table too, that table is directly the output of the CIE 1931
> algorithm. And yes 1024 step looks like lots of steps  but based on
> the tests 1024 steps for a 16 bit resolution PWM is reasonable, I
> guess (though it's a personal perception and opinion as I don't know
> how to calculate the number of really needed steps).

I think two different values on the userspace side should always map to 
different values on the kernel side. This should make it possible
to calculate the maximal number of steps by scaling up the table to the 
PWM resolution and then scanning for the smallest interval between 
table steps.

Once we have a maximal value we could either use it directly or we
might want to push it through min(calculated_max, 1024), on the
assumption that even for animated changes to backlight level that
1024 is a sensible limit[1]


[1] I think it is... I'd be interested to know of Doug A. shares this
    view..

> >
> >> +     0, 7, 14, 21, 28, 35, 43, 50, 57, 64, 71, 78, 85, 92, 99, 106, 114, 121,
> >> +     128, 135, 142, 149, 156, 163, 170, 177, 185, 192, 199, 206, 213, 220,
> >> +     227, 234, 241, 248, 256, 263, 270, 277, 284, 291, 298, 305, 312, 319,
> >> +     327, 334, 341, 348, 355, 362, 369, 376, 383, 390, 398, 405, 412, 419,
> >> +     426, 433, 440, 447, 454, 461, 469, 476, 483, 490, 497, 504, 511, 518,
> >> +     525, 532, 540, 547, 554, 561, 568, 575, 582, 589, 596, 603, 610, 618,
> >> +     625, 633, 640, 648, 655, 663, 671, 679, 687, 695, 703, 711, 719, 727,
> >> +     735, 744, 752, 761, 769, 778, 786, 795, 804, 813, 822, 831, 840, 849,
> >> +     858, 867, 876, 886, 895, 905, 914, 924, 934, 943, 953, 963, 973, 983,
> >> +     993, 1004, 1014, 1024, 1034, 1045, 1055, 1066, 1077, 1087, 1098, 1109,
> >> +     1120, 1131, 1142, 1153, 1165, 1176, 1187, 1199, 1210, 1222, 1234, 1245,
> >> +     1257, 1269, 1281, 1293, 1305, 1318, 1330, 1342, 1355, 1367, 1380, 1392,
> >> +     1405, 1418, 1431, 1444, 1457, 1470, 1483, 1497, 1510, 1523, 1537, 1551,
> >> +     1564, 1578, 1592, 1606, 1620, 1634, 1648, 1662, 1677, 1691, 1706, 1720,
> >> +     1735, 1750, 1765, 1780, 1795, 1810, 1825, 1840, 1855, 1871, 1886, 1902,
> >> +     1918, 1933, 1949, 1965, 1981, 1997, 2014, 2030, 2046, 2063, 2079, 2096,
> >> +     2113, 2130, 2146, 2163, 2181, 2198, 2215, 2232, 2250, 2267, 2285, 2303,
> >> +     2321, 2338, 2356, 2375, 2393, 2411, 2429, 2448, 2466, 2485, 2504, 2523,
> >> +     2542, 2561, 2580, 2599, 2618, 2638, 2657, 2677, 2697, 2716, 2736, 2756,
> >> +     2776, 2796, 2817, 2837, 2858, 2878, 2899, 2920, 2941, 2961, 2983, 3004,
> >> +     3025, 3046, 3068, 3089, 3111, 3133, 3155, 3177, 3199, 3221, 3243, 3266,
> >> +     3288, 3311, 3333, 3356, 3379, 3402, 3425, 3448, 3472, 3495, 3519, 3542,
> >> +     3566, 3590, 3614, 3638, 3662, 3686, 3711, 3735, 3760, 3784, 3809, 3834,
> >> +     3859, 3884, 3910, 3935, 3960, 3986, 4012, 4037, 4063, 4089, 4115, 4142,
> >> +     4168, 4194, 4221, 4248, 4274, 4301, 4328, 4356, 4383, 4410, 4438, 4465,
> >> +     4493, 4521, 4549, 4577, 4605, 4633, 4661, 4690, 4719, 4747, 4776, 4805,
> >> +     4834, 4863, 4893, 4922, 4952, 4981, 5011, 5041, 5071, 5101, 5131, 5162,
> >> +     5192, 5223, 5254, 5285, 5316, 5347, 5378, 5409, 5441, 5472, 5504, 5536,
> >> +     5568, 5600, 5632, 5664, 5697, 5729, 5762, 5795, 5828, 5861, 5894, 5928,
> >> +     5961, 5995, 6028, 6062, 6096, 6130, 6164, 6199, 6233, 6268, 6302, 6337,
> >> +     6372, 6407, 6442, 6478, 6513, 6549, 6585, 6621, 6657, 6693, 6729, 6765,
> >> +     6802, 6839, 6875, 6912, 6949, 6986, 7024, 7061, 7099, 7137, 7174, 7212,
> >> +     7250, 7289, 7327, 7366, 7404, 7443, 7482, 7521, 7560, 7600, 7639, 7679,
> >> +     7718, 7758, 7798, 7838, 7879, 7919, 7960, 8000, 8041, 8082, 8123, 8165,
> >> +     8206, 8248, 8289, 8331, 8373, 8415, 8457, 8500, 8542, 8585, 8628, 8671,
> >> +     8714, 8757, 8800, 8844, 8887, 8931, 8975, 9019, 9064, 9108, 9152, 9197,
> >> +     9242, 9287, 9332, 9377, 9423, 9468, 9514, 9560, 9606, 9652, 9698, 9745,
> >> +     9791, 9838, 9885, 9932, 9979, 10026, 10074, 10121, 10169, 10217, 10265,
> >> +     10313, 10362, 10410, 10459, 10508, 10557, 10606, 10655, 10704, 10754,
> >> +     10804, 10854, 10904, 10954, 11004, 11055, 11105, 11156, 11207, 11258,
> >> +     11310, 11361, 11413, 11464, 11516, 11568, 11620, 11673, 11725, 11778,
> >> +     11831, 11884, 11937, 11990, 12044, 12097, 12151, 12205, 12259, 12314,
> >> +     12368, 12423, 12477, 12532, 12587, 12643, 12698, 12754, 12809, 12865,
> >> +     12921, 12977, 13034, 13090, 13147, 13204, 13261, 13318, 13375, 13433,
> >> +     13491, 13548, 13606, 13665, 13723, 13781, 13840, 13899, 13958, 14017,
> >> +     14077, 14136, 14196, 14256, 14316, 14376, 14436, 14497, 14557, 14618,
> >> +     14679, 14740, 14802, 14863, 14925, 14987, 15049, 15111, 15173, 15236,
> >> +     15299, 15362, 15425, 15488, 15551, 15615, 15679, 15743, 15807, 15871,
> >> +     15935, 16000, 16065, 16130, 16195, 16260, 16326, 16392, 16457, 16523,
> >> +     16590, 16656, 16723, 16789, 16856, 16923, 16991, 17058, 17126, 17194,
> >> +     17261, 17330, 17398, 17467, 17535, 17604, 17673, 17742, 17812, 17881,
> >> +     17951, 18021, 18091, 18162, 18232, 18303, 18374, 18445, 18516, 18588,
> >> +     18659, 18731, 18803, 18875, 18947, 19020, 19093, 19166, 19239, 19312,
> >> +     19385, 19459, 19533, 19607, 19681, 19755, 19830, 19905, 19980, 20055,
> >> +     20130, 20206, 20281, 20357, 20433, 20510, 20586, 20663, 20740, 20817,
> >> +     20894, 20971, 21049, 21127, 21205, 21283, 21361, 21440, 21519, 21598,
> >> +     21677, 21756, 21836, 21915, 21995, 22075, 22156, 22236, 22317, 22398,
> >> +     22479, 22560, 22642, 22723, 22805, 22887, 22969, 23052, 23135, 23217,
> >> +     23300, 23384, 23467, 23551, 23635, 23719, 23803, 23887, 23972, 24057,
> >> +     24142, 24227, 24313, 24398, 24484, 24570, 24656, 24743, 24829, 24916,
> >> +     25003, 25091, 25178, 25266, 25354, 25442, 25530, 25618, 25707, 25796,
> >> +     25885, 25974, 26064, 26153, 26243, 26334, 26424, 26514, 26605, 26696,
> >> +     26787, 26879, 26970, 27062, 27154, 27246, 27338, 27431, 27524, 27617,
> >> +     27710, 27804, 27897, 27991, 28085, 28179, 28274, 28369, 28463, 28559,
> >> +     28654, 28749, 28845, 28941, 29037, 29134, 29230, 29327, 29424, 29521,
> >> +     29619, 29717, 29815, 29913, 30011, 30110, 30208, 30307, 30406, 30506,
> >> +     30605, 30705, 30805, 30906, 31006, 31107, 31208, 31309, 31410, 31512,
> >> +     31614, 31716, 31818, 31920, 32023, 32126, 32229, 32332, 32436, 32540,
> >> +     32644, 32748, 32852, 32957, 33062, 33167, 33272, 33378, 33484, 33590,
> >> +     33696, 33802, 33909, 34016, 34123, 34230, 34338, 34446, 34554, 34662,
> >> +     34770, 34879, 34988, 35097, 35206, 35316, 35426, 35536, 35646, 35757,
> >> +     35867, 35978, 36090, 36201, 36313, 36425, 36537, 36649, 36762, 36874,
> >> +     36987, 37101, 37214, 37328, 37442, 37556, 37671, 37785, 37900, 38015,
> >> +     38131, 38246, 38362, 38478, 38594, 38711, 38828, 38945, 39062, 39179,
> >> +     39297, 39415, 39533, 39651, 39770, 39889, 40008, 40127, 40247, 40367,
> >> +     40487, 40607, 40728, 40848, 40969, 41091, 41212, 41334, 41456, 41578,
> >> +     41700, 41823, 41946, 42069, 42193, 42316, 42440, 42564, 42689, 42813,
> >> +     42938, 43063, 43189, 43314, 43440, 43566, 43692, 43819, 43946, 44073,
> >> +     44200, 44328, 44456, 44584, 44712, 44840, 44969, 45098, 45227, 45357,
> >> +     45487, 45617, 45747, 45877, 46008, 46139, 46270, 46402, 46534, 46666,
> >> +     46798, 46930, 47063, 47196, 47329, 47463, 47596, 47730, 47865, 47999,
> >> +     48134, 48269, 48404, 48540, 48675, 48811, 48948, 49084, 49221, 49358,
> >> +     49495, 49633, 49771, 49909, 50047, 50185, 50324, 50463, 50603, 50742,
> >> +     50882, 51022, 51162, 51303, 51444, 51585, 51726, 51868, 52010, 52152,
> >> +     52294, 52437, 52580, 52723, 52867, 53010, 53154, 53299, 53443, 53588,
> >> +     53733, 53878, 54024, 54169, 54315, 54462, 54608, 54755, 54902, 55050,
> >> +     55197, 55345, 55493, 55642, 55790, 55939, 56089, 56238, 56388, 56538,
> >> +     56688, 56839, 56989, 57140, 57292, 57443, 57595, 57747, 57900, 58053,
> >> +     58205, 58359, 58512, 58666, 58820, 58974, 59129, 59284, 59439, 59594,
> >> +     59750, 59906, 60062, 60218, 60375, 60532, 60689, 60847, 61005, 61163,
> >> +     61321, 61480, 61639, 61798, 61957, 62117, 62277, 62437, 62598, 62759,
> >> +     62920, 63081, 63243, 63405, 63567, 63729, 63892, 64055, 64219, 64382,
> >> +     64546, 64710, 64875, 65039, 65204, 65369, 65535,
> >> +};
> >> +
> >>  struct pwm_bl_data {
> >>       struct pwm_device       *pwm;
> >>       struct device           *dev;
> >> @@ -38,6 +144,7 @@ struct pwm_bl_data {
> >>       unsigned int            scale;
> >>       bool                    legacy;
> >>       bool                    piecewise;
> >> +     bool                    use_lth_table;
> >
> > Again, I didn't think we'd need to special case the lookup table except
> > in the probe method. It's "just" a built-in levels table (ideally
> > reinforced with with code to figure out how many steps to interpolate).
> >
> 
> Ok.
> 
> >
> >>       int                     (*notify)(struct device *,
> >>                                         int brightness);
> >>       void                    (*notify_after)(struct device *,
> >> @@ -104,6 +211,8 @@ static int compute_duty_cycle(struct pwm_bl_data *pb, int brightness)
> >>               } else {
> >>                       duty_cycle = scale(pb, pb->levels[brightness]);
> >>               }
> >> +     } else if (pb->use_lth_table) {
> >> +             duty_cycle = cie1931_table[brightness];
> >>       } else {
> >>               duty_cycle = scale(pb, brightness);
> >>       }
> >> @@ -169,9 +278,9 @@ static int pwm_backlight_parse_dt(struct device *dev,
> >>       /* determine the number of brightness levels */
> >>       prop = of_find_property(node, "brightness-levels", &length);
> >>       if (!prop)
> >> -             return -EINVAL;
> >> -
> >> -     data->levels_count = length / sizeof(u32);
> >> +             data->use_lth_table = true;
> >> +     else
> >> +             data->levels_count = length / sizeof(u32);
> >>
> >>       /* read brightness levels from DT property */
> >>       if (data->levels_count > 0) {
> >> @@ -181,24 +290,28 @@ static int pwm_backlight_parse_dt(struct device *dev,
> >>               if (!data->levels)
> >>                       return -ENOMEM;
> >>
> >> -             ret = of_property_read_u32_array(node, "brightness-levels",
> >> -                                              data->levels,
> >> -                                              data->levels_count);
> >> -             if (ret < 0)
> >> -                     return ret;
> >> -
> >> -             ret = of_property_read_u32(node, "default-brightness-level",
> >> -                                        &value);
> >> -             if (ret < 0)
> >> -                     return ret;
> >> +             if (prop) {
> >> +                     ret = of_property_read_u32_array(node,
> >> +                                                      "brightness-levels",
> >> +                                                      data->levels,
> >> +                                                      data->levels_count);
> >> +                     if (ret < 0)
> >> +                             return ret;
> >> +             }
> >>
> >>               data->piecewise = of_property_read_bool(node,
> >>                                                   "use-linear-interpolation");
> >>
> >> -             data->dft_brightness = value;
> >>               data->levels_count--;
> >>       }
> >>
> >> +     ret = of_property_read_u32(node, "default-brightness-level",
> >> +                                &value);
> >> +     if (ret < 0)
> >> +             return ret;
> >> +
> >> +     data->dft_brightness = value;
> >> +
> >>       if (data->piecewise)
> >>               data->max_brightness = data->levels_count * NSTEPS;
> >>       else
> >> @@ -260,8 +373,10 @@ static int pwm_backlight_probe(struct platform_device *pdev)
> >>       struct backlight_device *bl;
> >>       struct device_node *node = pdev->dev.of_node;
> >>       struct pwm_bl_data *pb;
> >> +     struct pwm_state state;
> >>       struct pwm_args pargs;
> >>       int ret;
> >> +     int i;
> >>
> >>       if (!data) {
> >>               ret = pwm_backlight_parse_dt(&pdev->dev, &defdata);
> >> @@ -303,6 +418,7 @@ static int pwm_backlight_probe(struct platform_device *pdev)
> >>       pb->dev = &pdev->dev;
> >>       pb->enabled = false;
> >>       pb->piecewise = data->piecewise;
> >> +     pb->use_lth_table = data->use_lth_table;
> >>
> >>       pb->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
> >>                                                 GPIOD_ASIS);
> >> @@ -361,6 +477,22 @@ static int pwm_backlight_probe(struct platform_device *pdev)
> >>
> >>       dev_dbg(&pdev->dev, "got pwm for backlight\n");
> >>
> >> +     if (pb->use_lth_table) {
> >> +             /* Get PWM resolution */
> >> +             pwm_get_state(pb->pwm, &state);
> >> +             if (state.period > 65535) {
> >> +                     dev_err(&pdev->dev, "PWM resolution not supported\n");
> >> +                     goto err_alloc;
> >> +             }
> >> +             /* Find the number of steps based on the PWM resolution */
> >> +             for (i = 0; i < ARRAY_SIZE(cie1931_table); i++)
> >> +                     if (cie1931_table[i] >= state.period) {
> >> +                             data->max_brightness = i;
> >> +                             break;
> >> +                     }
> >> +             pb->scale = data->max_brightness;
> >> +     }
> >> +
> >>       /*
> >>        * FIXME: pwm_apply_args() should be removed when switching to
> >>        * the atomic PWM API.
> >> diff --git a/include/linux/pwm_backlight.h b/include/linux/pwm_backlight.h
> >> index 444a91b..4ec3b0d 100644
> >> --- a/include/linux/pwm_backlight.h
> >> +++ b/include/linux/pwm_backlight.h
> >> @@ -15,6 +15,7 @@ struct platform_pwm_backlight_data {
> >>       unsigned int pwm_period_ns;
> >>       unsigned int *levels;
> >>       unsigned int levels_count;
> >> +     bool use_lth_table;
> >
> > Why not just "if (!levels)"?
> >
> 
> Yep, should work.
> 
> >>       bool piecewise;
> >>       /* TODO remove once all users are switched to gpiod_* API */
> >>       int enable_gpio;
> >> --
> >> 2.9.3
> >>
> 
> If it's ok I'll send a first version (no RFC) of the patchet adding
> your comments.

Yes, I think this is more than practical enough to lose the RFC.


Daniel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
