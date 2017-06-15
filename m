From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/8] leds: as3645a: Add LED flash class driver
Date: Thu, 15 Jun 2017 15:47:49 +0200
Message-ID: <19eae367-e47c-7810-677b-98e3f6f0566d@gmail.com>
References: <1497433639-13101-1-git-send-email-sakari.ailus@linux.intel.com>
 <1497433639-13101-7-git-send-email-sakari.ailus@linux.intel.com>
 <343d88ea-c839-6682-df84-844f92bc9050@gmail.com>
 <20170614221028.GS12407@valkosipuli.retiisi.org.uk>
 <6d27154d-4550-d1ae-8b7a-07dcaaee69ac@gmail.com>
 <20170615133404.GF12407@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615133404.GF12407-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On 06/15/2017 03:34 PM, Sakari Ailus wrote:
> Hi Jacek,
> 
> On Thu, Jun 15, 2017 at 03:01:47PM +0200, Jacek Anaszewski wrote:
>> Hi Sakari,
>>
>> On 06/15/2017 12:10 AM, Sakari Ailus wrote:
>>> Hi Jacek,
>>>
>>> Thanks for the review!
>>
>> You're welcome!
>>
>>> I have to say I found the v4l2-flash-led-class framework quite useful, now
>>> that I refactored a driver for using it. Now we have a user for the
>>> indicator, too. :-)
>>
>> Nice :-). I'm also surprised that v4l2-flash API is also used in
>> drivers/staging/greybus/light.c which popped up with kbuild test robot
>> complaints.
> 
> I missed that on the first round of the submission as well. I'll fix that
> in v2.
> 
>>
>>> On Wed, Jun 14, 2017 at 11:15:24PM +0200, Jacek Anaszewski wrote:
>>>>> +static __maybe_unused int as3645a_suspend(struct device *dev)
>>>>> +{
>>>>> +	struct i2c_client *client = to_i2c_client(dev);
>>>>> +	struct as3645a *flash = i2c_get_clientdata(client);
>>>>> +	int rval;
>>>>> +
>>>>> +	rval = as3645a_set_control(flash, AS_MODE_EXT_TORCH, false);
>>>>> +	dev_dbg(dev, "Suspend %s\n", rval < 0 ? "failed" : "ok");
>>>>> +
>>>>> +	return rval;
>>>>> +}
>>>>> +
>>>>> +static __maybe_unused int as3645a_resume(struct device *dev)
>>>>> +{
>>>>> +	struct i2c_client *client = to_i2c_client(dev);
>>>>> +	struct as3645a *flash = i2c_get_clientdata(client);
>>>>> +	int rval;
>>>>> +
>>>>> +	rval = as3645a_setup(flash);
>>>>> +
>>>>
>>>> nitpicking: inconsistent coding style - there is no empty line before
>>>> dev_dbg() in the as3645a_suspend().
>>>
>>> Added one for as3645a_suspend() --- it should have been there.
>>>
>>>>
>>>>> +	dev_dbg(dev, "Resume %s\n", rval < 0 ? "fail" : "ok");
>>>>> +
>>>>> +	return rval;
>>>>> +}
>>>
>>> ...
>>>
>>>>> +static int as3645a_led_class_setup(struct as3645a *flash)
>>>>> +{
>>>>> +	struct led_classdev *fled_cdev = &flash->fled.led_cdev;
>>>>> +	struct led_classdev *iled_cdev = &flash->iled_cdev;
>>>>> +	struct led_flash_setting *cfg;
>>>>> +	int rval;
>>>>> +
>>>>> +	iled_cdev->name = "as3645a indicator";
>>>>> +	iled_cdev->brightness_set_blocking = as3645a_set_indicator_brightness;
>>>>> +	iled_cdev->max_brightness =
>>>>> +		flash->cfg.indicator_max_ua / AS_INDICATOR_INTENSITY_STEP;
>>>>> +
>>>>> +	rval = led_classdev_register(&flash->client->dev, iled_cdev);
>>>>> +	if (rval < 0)
>>>>> +		return rval;
>>>>> +
>>>>> +	cfg = &flash->fled.brightness;
>>>>> +	cfg->min = AS_FLASH_INTENSITY_MIN;
>>>>> +	cfg->max = flash->cfg.flash_max_ua;
>>>>> +	cfg->step = AS_FLASH_INTENSITY_STEP;
>>>>> +	cfg->val = flash->cfg.flash_max_ua;
>>>>> +
>>>>> +	cfg = &flash->fled.timeout;
>>>>> +	cfg->min = AS_FLASH_TIMEOUT_MIN;
>>>>> +	cfg->max = flash->cfg.flash_timeout_us;
>>>>> +	cfg->step = AS_FLASH_TIMEOUT_STEP;
>>>>> +	cfg->val = flash->cfg.flash_timeout_us;
>>>>> +
>>>>> +	flash->fled.ops = &as3645a_led_flash_ops;
>>>>> +
>>>>> +	fled_cdev->name = "as3645a flash";
>>>>
>>>> LED class device name should be taken from label DT property,
>>>> or DT node name if the former wasn't defined.
>>>>
>>>> Also LED device naming convention defines colon as a separator
>>>> between name segments.
>>>
>>> Right. I'll fix that.
>>>
>>> I just realised I'm missing DT binding documentation for this device; I'll
>>> add that, too.
>>>
>>> Is the preference to allow freely chosen node names for the LEDs? Now that
>>> there's the label, too, this appears to be somewhat duplicated information.
>>
>> It depends on whether the sub-leds are identified by reg property.
>> In this case usually common prefix is used followed by reg value,
>> e.g. led@1, led@2 etc.
> 
> Is there a device that would use this already? I checked common.txt and
> I couldn't find a suggestion of this scheme there.

There is no suitable suggestion in common.txt indeed, but it is used
e.g. in:

leds-mt6323.txt, leds-bcm6328.txt, leds-pm8058.txt.

>> Otherwise prevailing scheme is e.g.:
>>
>>         blue-power {
>> 		...
>>                 label = "netxbig:blue:power";
>> 	}
>>
> 

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
