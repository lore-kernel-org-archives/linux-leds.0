From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: RGB support prototype
Date: Sun, 13 Aug 2017 12:31:34 +0200
Message-ID: <87ddf9f2-40b8-fd3a-f106-35b202697391@gmail.com>
References: <20170812224818.GA5960@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:35789 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752510AbdHMKcU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Aug 2017 06:32:20 -0400
In-Reply-To: <20170812224818.GA5960@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi,

On 08/13/2017 12:48 AM, Pavel Machek wrote:
> 
> Hi!
> 
> You mentioned you was working on RGB support prototype. Could you post
> copy of the patches (even if unfinished)?

Unfortunately it is at the stage of unfinished proof of concept and
I haven't managed yet to try how it fits to all API use cases we have.
Nor is it in a shape ready to post to the lists.

I think we could try to discuss the design here. I'll list all the
issues I encountered during the implementation:

Currently we set LED brightness with following API:

void led_set_brightness(struct led_classdev *led_cdev,
                        enum led_brightness brightness);

In case of RGB LED we could have something like this:

struct led_color_triplet {
        enum led_brightness red;
        enum led_brightness green;
        enum led_brightness blue;
};

void led_rgb_set_brightness(struct led_rgb_classdev *led_rgb_cdev,
                        struct led_color_triplet *color);

We've agreed that LED RGB class device color could be set by writing
space separated list of "r g b" color values to a sysfs "color" file.

While the above itself shouldn't raise too many doubts, they
arise quickly while trying to adapt it to the internal LED core
facilities:

- led_base_timer_function()
- set_brightness_delayed()
- led_blink_* API family

All these introduce problems especially with brightness/color type.
I tried to add a new abstraction layer by introducing
struct led_base_cdev with a set of generic ops that could be initialized
by particular type of LED but still the problem with brightness type
generalization remains. One solution could be an union with fields
mapping to either single or three brightness components.

Other option could be void *brightness type which could be then
cast to the required brightness type basing on the LED flag.

Generally it seems that all existing LED class API should get its
generic counterparts.

Other ideas are welcome.

-- 
Best regards,
Jacek Anaszewski
