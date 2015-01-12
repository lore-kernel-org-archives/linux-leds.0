From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH/RFC v10 15/19] media: Add registration helpers for V4L2
 flash sub-devices
Date: Mon, 12 Jan 2015 10:46:26 +0100
Message-ID: <54B397F2.6060205@samsung.com>
References: <1420816989-1808-1-git-send-email-j.anaszewski@samsung.com>
 <1420816989-1808-16-git-send-email-j.anaszewski@samsung.com>
 <20150109205432.GP18076@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20150109205432.GP18076@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

Thanks for the review.

On 01/09/2015 09:54 PM, Pavel Machek wrote:
> On Fri 2015-01-09 16:23:05, Jacek Anaszewski wrote:
>> This patch adds helper functions for registering/unregistering
>> LED Flash class devices as V4L2 sub-devices. The functions should
>> be called from the LED subsystem device driver. In case the
>> support for V4L2 Flash sub-devices is disabled in the kernel
>> config the functions' empty versions will be used.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
>> Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>
> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
>
>> +	/*
>> +	 * Indicator leds, unlike torch leds, are turned on/off basing
>> on
>
> leds -> LEDs.

Sure.

>> +	 * the state of V4L2_CID_FLASH_INDICATOR_INTENSITY control only.
>> +	 * Therefore it must be possible to set it to 0 level which in
>> +	 * the LED subsystem reflects LED_OFF state.
>> +	 */
>> +	if (cdata_id != INDICATOR_INTENSITY)
>> +		++__intensity;
>
> And normally we'd do i++ instead of ++i, and avoid __ for local
> variables...?

Pre-incrementation operator is favourable over the post-incrementation
one if we don't want to have an access to the value of a variable before
incrementation, which is the case here.
Maybe gcc detects the cases when the value of a variable is not assigned
and doesn't copy it before incrementing, however I haven't found any
reference. I see that often in the for loops the i++ version
is used, but I am not sure if this is done because developers are
aware that gcc will optimize it anyway or it is just an omission.

And regarding __ for local variable - I haven't found any restriction
about it in the Documentation/CodingStyle. Nevertheless I can rename
it to tmp or something.

>> +/**
>> + * struct v4l2_flash_ctrl_config - V4L2 Flash controls initialization data
>> + * @intensity:			constraints for the led in a non-flash mode
>> + * @flash_intensity:		V4L2_CID_FLASH_INTENSITY settings constraints
>> + * @flash_timeout:		V4L2_CID_FLASH_TIMEOUT constraints
>> + * @flash_faults:		possible flash faults
>> + * @has_external_strobe:	external strobe capability
>> + * @indicator_led:		signifies that a led is of indicator type
>> + */
>> +struct v4l2_flash_ctrl_config {
>> +	struct v4l2_ctrl_config intensity;
>> +	struct v4l2_ctrl_config flash_intensity;
>> +	struct v4l2_ctrl_config flash_timeout;
>> +	u32 flash_faults;
>> +	bool has_external_strobe:1;
>> +	bool indicator_led:1;
>> +};
>
> I don't think you are supposed to do boolean bit arrays.

These bit fields allow to reduce memory usage. If they were not bit
fields, the address of the next variable would be aligned to the
multiply of the CPU word size.
Please look e.g. at struct dev_pm_info in the file include/linux/pm.h.
It also contains boolean bit fields.

-- 
Best Regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
