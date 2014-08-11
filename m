From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH/RFC v4 15/21] media: Add registration helpers for V4L2 flash
Date: Mon, 11 Aug 2014 15:45:27 +0200
Message-ID: <53E8C8F7.2070101@samsung.com>
References: <1405087464-13762-1-git-send-email-j.anaszewski@samsung.com>
 <1405087464-13762-16-git-send-email-j.anaszewski@samsung.com>
 <53CCF59E.3070200@iki.fi> <53DF9C2A.8060403@samsung.com>
 <20140811122628.GG16460@valkosipuli.retiisi.org.uk>
 <53E8C4BA.6050805@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <53E8C4BA.6050805@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: linux-leds@vger.kernel.org

> On 08/11/2014 02:26 PM, Sakari Ailus wrote:
>>
>> Hi Jacek,
>>

...

>>>>> +static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
>>>>> +{
>>>>> +    struct v4l2_flash *v4l2_flash = v4l2_ctrl_to_v4l2_flash(c);
>>>>> +    struct led_classdev_flash *flash = v4l2_flash->flash;
>>>>> +    struct v4l2_flash_ctrl *ctrl = &v4l2_flash->ctrl;
>>>>> +    struct v4l2_flash_ctrl_config *config = &v4l2_flash->config;
>>>>> +    enum led_brightness torch_brightness;
>>>>> +    bool external_strobe;
>>>>> +    int ret;
>>>>> +
>>>>> +    switch (c->id) {
>>>>> +    case V4L2_CID_FLASH_LED_MODE:
>>>>> +        switch (c->val) {
>>>>> +        case V4L2_FLASH_LED_MODE_NONE:
>>>>> +            call_flash_op(v4l2_flash, torch_brightness_set,
>>>>> +                            &flash->led_cdev, 0);
>>>>> +            return call_flash_op(v4l2_flash, strobe_set, flash,
>>>>> +                            false);
>>>>> +        case V4L2_FLASH_LED_MODE_FLASH:
>>>>> +            /* Turn off torch LED */
>>>>> +            call_flash_op(v4l2_flash, torch_brightness_set,
>>>>> +                            &flash->led_cdev, 0);
>>>>> +            external_strobe = (ctrl->source->val ==
>>>>> +                    V4L2_FLASH_STROBE_SOURCE_EXTERNAL);
>>>>> +            return call_flash_op(v4l2_flash, external_strobe_set,
>>>>> +                        flash, external_strobe);
>>>>> +        case V4L2_FLASH_LED_MODE_TORCH:
>>>>> +            /* Stop flash strobing */
>>>>> +            ret = call_flash_op(v4l2_flash, strobe_set, flash,
>>>>> +                            false);
>>>>> +            if (ret)
>>>>> +                return ret;
>>>>> +
>>>>> +            torch_brightness =
>>>>> +                v4l2_flash_intensity_to_led_brightness(
>>>>> +                        &config->torch_intensity,
>>>>> +                        ctrl->torch_intensity->val);
>>>>> +            call_flash_op(v4l2_flash, torch_brightness_set,
>>>>> +                    &flash->led_cdev, torch_brightness);
>>>>> +            return ret;
>>>>> +        }
>>>>> +        break;
>>>>> +    case V4L2_CID_FLASH_STROBE_SOURCE:
>>>>> +        external_strobe = (c->val ==
>>>>> V4L2_FLASH_STROBE_SOURCE_EXTERNAL);
>>>>
>>>> Is the external_strobe argument match exactly to the strobe source
>>>> control? You seem to assume that in g_volatile_ctrl() above. I think
>>>> having it the either way is fine but not both. :-)
>>>
>>> The STROBE_SOURCE_EXTERNAL control state is volatile if a flash device
>>> depends on muxes that route strobe signals to more then one flash
>>> device. In such a case it behaves similarly to FLASH_STROBE control,
>>> i.e. it activates external strobe only for the flash timeout period.
>>> I touched this issue in the cover letter of this patch series,
>>> paragraph 2.
>>
>> I meant that flash->external_strobe is directly used as
>> V4L2_CID_FLASH_STROBE_SOURCE. Are the two guaranteed to be the same?

Yes, the external_strobe sysfs attribute is mapped to it.

Best Regards,
Jacek Anaszewski
