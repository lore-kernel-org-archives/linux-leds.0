From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v2 1/2] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LEDs
Date: Thu, 14 Feb 2019 09:55:40 +0300
Message-ID: <20190214065540.GA16597@jeknote.loshitsa1.net>
References: <20190212205901.13037-1-jekhor@gmail.com>
 <20190212205901.13037-2-jekhor@gmail.com>
 <1df39a63-533f-bb68-a056-a0241f148be9@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1df39a63-533f-bb68-a056-a0241f148be9@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed, Feb 13, 2019 at 11:43:29PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 12-02-19 21:59, Yauhen Kharuzhy wrote:
> > Add support for LEDs connected to the Intel Cherry Trail Whiskey Cove
> > PMIC. Charger and general-purpose leds are supported. Hardware blinking
> > is implemented, breathing is not.
> > 
> > This driver was tested with Lenovo Yoga Book notebook.
> 
> Thank you for working on this. The CHT Whiskey Cove PMIC is
> also used on the GPD win and GPD pocket devices and there LED1
> by default indicates the charging status.
> 
> Since your driver forces the LED into SWCTL mode on probe()
> this means that any kernel with it enabled will break the
> charging LEDs OOTB function, this is undesirable.
> 
> I believe it would be best to add a custom "mode" attribute
> to the led classdev, with "manual" and "on-when-charging"
> modes, this would then control bits 0-1 of reg 0x5e1f and
> by default these bits should be left as is when the driver
> loads.
> 
> Note that in my experience the "charging" mode only works
> when bits 0-1 have the value 10. I've some written notes from
> when I played with this myself and they say:
> 
>    -CHT WC powerled control 0x5e1f: bits 0-1:
>     0: ????
>     1: Off
>     2: On when charging
>     3: On
>    -CHT WC powerled pattern control 0x5e20: bits 1-2:
>     0: Off
>     1: On
>     2: Blinking
>     3: Glowing

Maybe you are right, I will check but at Linux Yoga Book this LED
doesn't work as HW-controlled charging status indicator, so I didn't
discovery this.

I used this source as reference; https://github.com/jekhor/yogabook-linux-android-kernel/blob/cm-13.0/drivers/misc/charger_gp_led.c

> Also note that the 0x5e20 notes do not match with your
> defines, I believe this is a small bug in your code, see
> comments in line below.
> 
> As for the 0x5e20 settings, I believe another custom
> sysfs attribute, called "breathing" would be a good idea to
> export the breathing functionality.
> 
> The way I see this working is that writing "1" to this will
> turn on glowing mode, and writing 0 to it, or 0 to brightness
> will turn it off. Reading it will return 1/0 depending on
> whether the LED is in glowing mode or not.

Jacek? Pavel? I thought about pattern_set() implementation for 'breathing'
mode in future but this doesn't seem simple, maybe custom attribute will has
sense?

> 
> For an example of adding custom sysfs attributes to a
> led-class device see kbd_led_groups and kbd_led_attrs in:
> drivers/platform/x86/dell-laptop.c
> 
> > +
> > +#define CHT_WC_LED1_CTRL		0x5e1f
> > +#define CHT_WC_LED1_FSM			0x5e20
> > +#define CHT_WC_LED1_PWM			0x5e21
> > +
> > +#define CHT_WC_LED2_CTRL		0x4fdf
> > +#define CHT_WC_LED2_FSM			0x4fe0
> > +#define CHT_WC_LED2_PWM			0x4fe1
> > +
> > +/* HW or SW control of charging led */
> > +#define CHT_WC_LED1_SWCTL		BIT(0)
> > +#define CHT_WC_LED1_ON			BIT(1)
> > +
> > +#define CHT_WC_LED2_ON			BIT(0)
> > +#define CHT_WC_LED_I_MA2_5		(2 << 2)
> > +/* LED current limit */
> > +#define CHT_WC_LED_I_MASK		GENMASK(3, 2)
> > +
> > +#define CHT_WC_LED_F_1_4_HZ		(0 << 4)
> > +#define CHT_WC_LED_F_1_2_HZ		(1 << 4)
> > +#define CHT_WC_LED_F_1_HZ		(2 << 4)
> > +#define CHT_WC_LED_F_2_HZ		(3 << 4)
> > +#define CHT_WC_LED_F_MASK		0x30
> > +
> > +#define CHT_WC_LED_EFF_ON		BIT(1)
> > +#define CHT_WC_LED_EFF_BLINKING		BIT(2)
> > +#define CHT_WC_LED_EFF_BREATHING	BIT(3)
> > +#define CHT_WC_LED_EFF_MASK		0x06
> 
> So your MASK is correct here, but the values used should
> be based on that, so you get:
> 
> #define CHT_WC_LED_EFF_ON		(1 << 1)
> #define CHT_WC_LED_EFF_BLINKING		(2 << 1)
> #define CHT_WC_LED_EFF_BREATHING	(3 << 1)
> 
> Note that this effectively only changes the value of
> CHT_WC_LED_EFF_BREATHING, so that it now to fits in your
> mask.
> 
> Regards,

Hm, it seems lost in refactoring time, thanks. My original defines were:

#define CHT_WC_LED_EFF_ON               (1<<1)
#define CHT_WC_LED_EFF_BLINKING         (2<<1)
#define CHT_WC_LED_EFF_BREATHING        (3<<1)
#define CHT_WC_LED_EFF_MASK             0x06

I will revert this in next version.

-- 
Yauhen Kharuzhy
