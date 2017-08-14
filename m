From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: RGB support prototype
Date: Mon, 14 Aug 2017 20:26:30 +0200
Message-ID: <d295d76a-3a51-cb94-d452-8f68d3d65a67@gmail.com>
References: <20170812224818.GA5960@amd>
 <87ddf9f2-40b8-fd3a-f106-35b202697391@gmail.com>
 <20170813114100.GA6321@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:38437 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750753AbdHNS1O (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Aug 2017 14:27:14 -0400
In-Reply-To: <20170813114100.GA6321@xo-6d-61-c0.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi,

On 08/13/2017 01:41 PM, Pavel Machek wrote:
> Hi!
> 
>>> You mentioned you was working on RGB support prototype. Could you post
>>> copy of the patches (even if unfinished)?
>>
>> Unfortunately it is at the stage of unfinished proof of concept and
>> I haven't managed yet to try how it fits to all API use cases we have.
>> Nor is it in a shape ready to post to the lists.
>>
>> I think we could try to discuss the design here. I'll list all the
>> issues I encountered during the implementation:
>>
>> Currently we set LED brightness with following API:
>>
>> void led_set_brightness(struct led_classdev *led_cdev,
>>                         enum led_brightness brightness);
>>
>> In case of RGB LED we could have something like this:
>>
>> struct led_color_triplet {
>>         enum led_brightness red;
>>         enum led_brightness green;
>>         enum led_brightness blue;
>> };
>>
>> void led_rgb_set_brightness(struct led_rgb_classdev *led_rgb_cdev,
>>                         struct led_color_triplet *color);
>>
>> We've agreed that LED RGB class device color could be set by writing
>> space separated list of "r g b" color values to a sysfs "color" file.
>>
>> While the above itself shouldn't raise too many doubts, they
>> arise quickly while trying to adapt it to the internal LED core
>> facilities:
>>
>> - led_base_timer_function()
>> - set_brightness_delayed()
>> - led_blink_* API family
>>
>> All these introduce problems especially with brightness/color type.
>> I tried to add a new abstraction layer by introducing
>> struct led_base_cdev with a set of generic ops that could be initialized
>> by particular type of LED but still the problem with brightness type
>> generalization remains. One solution could be an union with fields
>> mapping to either single or three brightness components.
>>
>> Other option could be void *brightness type which could be then
>> cast to the required brightness type basing on the LED flag.
> 
> Void *brightness is not really a good option.
> 
> We could pass triplet even in case of single-color LEDs, and then use
> just one component.
> 
> Another option would be to store color in HSV colorspace (not RGB). Then existing
> functions would get brightness (== value in HSV), and RGB-aware functions would
> operate on all 3 components. Triggers/blinking/etc. would then continue operating,
> without modifications.
> 
> We could even export (read-only) hue/saturation for single-color LEDs...

Related patches from Heiner Kallweit are still sitting on devel branch
of linux-leds.git:

https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/log/?h=devel

Possibly it can serve as a basis for further development.

I liked that approach because it was compatible with monochrome
LEDs and triggers.

-- 
Best regards,
Jacek Anaszewski
