Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F433382F4;
	Sun, 11 Oct 2026 22:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791758912; cv=none; b=XM1Po92j9arqCYBJntHtOaoW2DP/A//743MlzaRZIoEEo2ugp+wfcCfMyWubiUbmr4F+DxAKesMZfI+XkUMC7vTd5dO8UH5jW47ISAIDUha48gFshWQUIh6xzrZzOYF+Ek2v/9hd/ZTdpZ1ost8oZ3tjY+uoB2irlL3QHQirspw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791758912; c=relaxed/simple;
	bh=yJEPBlC5nT1CigL03QRO6yG3OkLI1KKcyZZ6A74vTDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=euyRQ6oZhnYauCmmF+lt0RzGQRcuSK4Am9PV+B4a3s9S5yKB4VxIa3aj77Z/Gd5yGUUb8SR6OqnY6AjunZJBxRs3JgV8P41xzFwfltG1taERkT31wHSIqpkkx1ooIdEYr0mXv9K9UNGeMrPG59Pm5YvA1LKgXmwGvgdyH2QSgso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cPLj3e2K; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cPLj3e2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791758901; x=1792363701; i=w_armin@gmx.de;
	bh=53JZ/Q1ARGK63oDJWLvZE84AmYlbJerUyK4nju7LJlk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cPLj3e2Kx8SAjnJmkZwdzi0lJuR+fFUZsVX9osrodGgEYn1g11emrQmt6S2bhEMR
	 fL6b4i/FIfjDhduHfw3UFYpd7uP0ZM0D2gFN0PJgmGRwbS9UeukaFaj9xeqXXzfuV
	 zEyqunSXA4pLcVc9vO1lL/eosRseuXth7BwT1/TXbPq3W0K+o6hyvJL48fKMp+JN9
	 bi3eOSZOkttQP36QeH97BIi39V1PYgRJYsghM9GRJNfBUUWaPsdDA4iiDQF/yBg8A
	 bTRBPjABtLzzKo81C3qc8EX529a91+V9vgONM6oYUn1I1m9SzemavCIKYCjd8p1vS
	 mlbW+G0TtZ3zDSe+eg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTiPl-1x4KVN3QPF-00Yosa; Mon, 12
 Oct 2026 00:48:20 +0200
Message-ID: <30de83b7-8016-4b33-9e5c-6138b32766ab@gmx.de>
Date: Mon, 12 Oct 2026 00:48:19 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] platform/x86: uniwill-laptop: Implement rainbow
 animation as trigger
To: Rong Zhang <i@rong.moe>, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 wse@tuxedocomputers.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
References: <20261007144101.323289-1-W_Armin@gmx.de>
 <20261007144101.323289-3-W_Armin@gmx.de>
 <035799dd461fe0e7a60564e11f10fd23eb3daabf.camel@rong.moe>
 <9087d109-d757-43bc-b80d-64df7dc9ff82@gmx.de>
 <b31878aeb4af648106adc74efbb2d1e839f9f8ea.camel@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <b31878aeb4af648106adc74efbb2d1e839f9f8ea.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UbwCopjJOqTWw4Q+IZcZ7vMO0ssX6s+c2Ch28c/E9Ti+epghxRN
 6DxCG/EVKSZ+LrGycX57S1vMtUdnb+f7V5NJyhdRxcBIJHw949rshSihRBE6+39Chz7sCeq
 cXrO7QyD0M6z2OKk13YfuVcYVcsnoYI7jzPrUryh9JL7f5ULQgqZvXj6pWj2M8tPLi2PlrT
 hvclvlZ3yl4dd8qwJHijg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cn/e4Q/HBEo=;MW4QG2d1filLnhwRRc1ds4Hcjo/
 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
 =

Am 11.10.26 um 21:47 schrieb Rong Zhang:

> Hi Armin,
>
> On Sun, 2026-10-11 at 02:52 +0200, Armin Wolf wrote:
>> Am 10.10.26 um 13:20 schrieb Rong Zhang:
>>
>>> Hi Armin,
>>>
>>> On Wed, 2026-10-07 at 16:38 +0200, Armin Wolf wrote:
>>>> It turns out that some models require the lightbar to be activated
>>>> in order to display the rainbow animation, so users have to access
>>>> both the "rainbow_animation" sysfs attribute and the LED sysfs
>>>> interface when enabling the rainbow animation. This can cause short
>>>> glitches when the lightbar was previously disabled.
>>>>
>>>> Fix this by replacing the sysfs attribute with a custom LED trigger
>>>> called "uniwill-rainbow". Selecting this trigger will atomically
>>>> activate the lightbar and enable the rainbow animation mode. This
>>>> can potentially break userspace applications using the old sysfs
>>>> attribute, but so far no such application is known to exist (yet).
>>>>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>>    .../ABI/removed/sysfs-driver-uniwill-laptop   |  10 ++
>>>>    .../ABI/testing/sysfs-driver-uniwill-laptop   |  11 --
>>>>    .../admin-guide/laptops/uniwill-laptop.rst    |   5 +-
>>>>    MAINTAINERS                                   |   1 +
>>>>    drivers/platform/x86/uniwill/Kconfig          |   1 +
>>>>    drivers/platform/x86/uniwill/uniwill-acpi.c   | 133 +++++++++++---=
=2D---
>>>>    6 files changed, 95 insertions(+), 66 deletions(-)
>>>>    create mode 100644 Documentation/ABI/removed/sysfs-driver-uniwill-=
laptop
>>>>
>>>> diff --git a/Documentation/ABI/removed/sysfs-driver-uniwill-laptop b/=
Documentation/ABI/removed/sysfs-driver-uniwill-laptop
>>>> new file mode 100644
>>>> index 000000000000..c226efc23b59
>>>> --- /dev/null
>>>> +++ b/Documentation/ABI/removed/sysfs-driver-uniwill-laptop
>>>> @@ -0,0 +1,10 @@
>>>> +What:		/sys/bus/platform/devices/INOU0000:XX/rainbow_animation
>>>> +Date:		November 2025
>>>> +KernelVersion:	6.19
>>>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>>>> +Description:
>>>> +		Forces the integrated lightbar to display a rainbow animation when=
 the machine
>>>> +		is not suspended. Writing "1"/"0" into this file enables/disables =
this
>>>> +		functionality.
>>>> +
>>>> +		Reading this file returns the current status of the rainbow animat=
ion functionality.
>>> It'd be more helpful by documenting the removal date, version and what
>>> has replaced it.
>> True, i will write a patch to address this.
> [..snip..]
>
>>>> -
>>>>    static ssize_t breathing_in_suspend_store(struct device *dev, stru=
ct device_attribute *attr,
>>>>    					  const char *buf, size_t count)
>>>>    {
>>>> @@ -1258,7 +1213,6 @@ static struct attribute *uniwill_attrs[] =3D {
>>>>    	&dev_attr_super_key_enable.attr,
>>>>    	&dev_attr_touchpad_toggle_enable.attr,
>>>>    	/* Lightbar-related */
>>>> -	&dev_attr_rainbow_animation.attr,
>>>>    	&dev_attr_breathing_in_suspend.attr,
>>>>    	/* Power-management-related */
>>>>    	&dev_attr_ctgp_offset.attr,
>>>> @@ -1288,8 +1242,7 @@ static umode_t uniwill_attr_is_visible(struct k=
object *kobj, struct attribute *a
>>>>    			return attr->mode;
>>>>    	}
>>>>   =20
>>>> -	if (attr =3D=3D &dev_attr_rainbow_animation.attr ||
>>>> -	    attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
>>>> +	if (attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
>>>>    		if (uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR))
>>>>    			return attr->mode;
>>> It'd be better to convert breathing_in_suspend into an LED device
>>> attribute. See led_classdev->groups.
>> We cannot do this because this field is being used by the multicolor LE=
D class.
> Whoops, I didn't notice that.
>
>> I can try to find a workaround for this.
> (+CC Lee, Pavel, linux-leds)
>
> IMO the best way to solve the dilemma is to introduce class_group for
> led-class-multicolor and led-class-flash, or else we will have to
> introduce (or have already introduced?) more workarounds for other
> drivers.

I think we should rather use a separate device_type for multicolor/flash L=
ED devices,
because this allows us to inject the sysfs groups without having to introd=
uce yet
another field.

Would it be acceptable if multicolor/flash LED support cannot be build as =
a module anymore?

Thanks,
Armin Wolf

>
> For this cycle let's keep the attribute as is.
>
> [..snip..]
>
>>>> +
>>>> +static struct led_trigger uniwill_lightbar_trigger =3D {
>>>> +	.name =3D "uniwill-rainbow",
>>>> +	.activate =3D uniwill_lightbar_trigger_activate,
>>>> +	.deactivate =3D uniwill_lightbar_trigger_deactivate,
>>>> +	.trigger_type =3D &uniwill_lightbar_trigger_type,
>>>> +};
>>>> +
>>>>    #define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIG=
HTBAR_S3_OFF | LIGHTBAR_WELCOME)
>>>>   =20
>>>>    static int uniwill_led_init(struct uniwill_data *data)
>>>> @@ -1587,12 +1593,18 @@ static int uniwill_led_init(struct uniwill_da=
ta *data)
>>>>    	data->led_mc_cdev.led_cdev.max_brightness =3D 1;
>>>>    	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
>>>>    	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_le=
d_brightness_set;
>>>> +	data->led_mc_cdev.led_cdev.trigger_type =3D &uniwill_lightbar_trigg=
er_type;
>>>> +	data->led_mc_cdev.led_cdev.hw_control_trigger =3D uniwill_lightbar_=
trigger.name;
>>>> +	data->led_mc_cdev.led_cdev.hw_control_set =3D uniwill_led_hw_contro=
l_set;
>>> A private trigger does not need hw_control_set, which is only meant to
>>> coordinate between different drivers, i.e., in the case when the LED
>>> device and the hardware control trigger are located at different drive=
rs.
>>>
>>> I've also updated the documentation in commit 8e04e5382aa9 ("leds:
>>> trigger: Add hw_offloaded() callback and provide
>>> trigger_may_offload_to_hw attribute"), quoted below:
>>>
>>>      Alternatively, a private trigger can be implemented along with th=
e LED
>>>      driver if the LED's hardware control doesn't fit any generic trig=
ger. To
>>>      associate the private trigger with the LED classdev, their `trigg=
er_type`
>>>      must be the same. To declare that the private trigger provides ha=
rdware
>>>      control for the associated LED classdev, set the `hw_control_trig=
ger`
>>>      string to the trigger's name. Since both the LED classdev and the=
 private
>>>      trigger are in the same LED driver, it's not necessary for them t=
o
>>>      coordinate via `hw_control_*` callbacks.
>>>
>>> I'd suggest calling uniwill_led_hw_control_set() directly from the
>>> trigger's [de]activate callbacks, just like other drivers.
>> I decided to use this callbacks in order to be able to add support for =
the keyboard backlight
>> animation in the future (if we someday find a device that supports this=
 feature).
> The name "uniwill-rainbow" sounds irrelevant to keyboard backlight
> animation. In this case the latter needs a new private trigger with a ne=
w
> name, and it can have different [de]activate callbacks. IOW, we don't
> need hw_control_set() either.
>
> Otherwise, using hw_control_set() makes sense to me as long as the
> current name is relevant.
>
>
>
> Since I've CC'ed leds folks:
>
> Per-key lighting is becoming increasingly common for keyboard backlight.
>
> I am actually thinking about introducing LED array/matrix support to the
> leds subsystem. An LED array/matrix device is just a special LED device
> that controls all constituent LED devices, so that we can:
>
> - implement keyboard backlight animation (or LampArray autonomous mode)
> as an array/matrix hardware control trigger [1]
> - tune the lighting of the whole array/matrix at once by tuning the LED
> array/matrix device [2]
> - tune per-key lighting by tuning constituent LED devices
> - apply generic LED triggers to the whole array/matrix [1]
> - apply different generic LED triggers to different constituent LED
> devices
> - properly deconflict the above operations
>
> It definitely requires a lot of work to get things (especially locking
> and atomicity) right, but it should be very helpful for devices with per=
-
> key lighting once done. I believe missing proper LED array/matrix suppor=
t
> was the main reason why tuxedo_nb04_wmi_ab [3] implemented a virtual
> LampArray HID device far before any userspace LampArray tool emerged.
>
> [1]: The constituent LED devices will be inoperable when a trigger is
> active on their array/matrix LED device.
>
> [2]: The leds subsystem won't emulate this. The driver must implement
> brightness_get() and brightness_set[_blocking]() for the LED array/matri=
x
> device.
>
> [3]: I know Texudo folks are working on adding hid-lamparray to connect
> it to the LED subsystem. I've had another independent implementation wit=
h
> HIDRAW sniff, no hid-generic dependency, autonomous mode as a trigger,
> non-RGB LampArray support, and per-key LED device support in my local
> tree, but that's another story. I will firstly push it further without
> LED array/matrix support. Then I will try to add LED array/matrix
> support, with hid-lamparray being the first user.
>
> Thanks,
> Rong
>
>>>>   =20
>>>>    	if (value & LIGHTBAR_S0_OFF)
>>>>    		data->led_mc_cdev.led_cdev.brightness =3D 0;
>>>>    	else
>>>>    		data->led_mc_cdev.led_cdev.brightness =3D 1;
>>>>   =20
>>>> +	if (value & LIGHTBAR_WELCOME)
>>> Check !LIGHTBAR_S0_OFF too?
>>>
>>> If the last state is LIGHTBAR_S0_OFF|LIGHTBAR_WELCOME (probably caused=
 by
>>> an outdated driver without this patch), the trigger's activate callbac=
k
>>> will be called on probe, lighting up the previously off LED. Is this
>>> intentional?
>>>
>>> Thanks,
>>> Rong
>> Yes, this is intentional. LIGHTBAR_WELCOME implies !LIGHTBAR_S0_OFF, so=
me devices
>> even assume this.
>>
>> Thanks,
>> Armin Wolf
>>
>>>> +		data->led_mc_cdev.led_cdev.default_trigger =3D uniwill_lightbar_tr=
igger.name;
>>>> +
>>>>    	for (int i =3D 0; i < LED_CHANNELS; i++) {
>>>>    		data->led_mc_subled_info[i].color_index =3D color_indices[i];
>>>>   =20
>>>> @@ -3540,17 +3552,31 @@ static int __init uniwill_init(void)
>>>>    		pr_warn("Enabling potentially unsupported features\n");
>>>>    	}
>>>>   =20
>>>> -	ret =3D platform_driver_register(&uniwill_driver);
>>>> +	/*
>>>> +	 * We cannot register the trigger inside the .probe callback of the
>>>> +	 * platform driver, because each trigger needs a unique name.
>>>> +	 */
>>>> +	ret =3D led_trigger_register(&uniwill_lightbar_trigger);
>>>>    	if (ret < 0)
>>>>    		return ret;
>>>>   =20
>>>> +	ret =3D platform_driver_register(&uniwill_driver);
>>>> +	if (ret < 0)
>>>> +		goto err_platform;
>>>> +
>>>>    	ret =3D uniwill_wmi_register_driver();
>>>> -	if (ret < 0) {
>>>> -		platform_driver_unregister(&uniwill_driver);
>>>> -		return ret;
>>>> -	}
>>>> +	if (ret < 0)
>>>> +		goto err_wmi;
>>>>   =20
>>>>    	return 0;
>>>> +
>>>> +err_wmi:
>>>> +	platform_driver_unregister(&uniwill_driver);
>>>> +
>>>> +err_platform:
>>>> +	led_trigger_unregister(&uniwill_lightbar_trigger);
>>>> +
>>>> +	return ret;
>>>>    }
>>>>    module_init(uniwill_init);
>>>>   =20
>>>> @@ -3558,6 +3584,7 @@ static void __exit uniwill_exit(void)
>>>>    {
>>>>    	uniwill_wmi_unregister_driver();
>>>>    	platform_driver_unregister(&uniwill_driver);
>>>> +	led_trigger_unregister(&uniwill_lightbar_trigger);
>>>>    }
>>>>    module_exit(uniwill_exit);
>>>>   =20
