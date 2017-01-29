From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] tools/leds: Add led_hw_brightness_mon program
Date: Sun, 29 Jan 2017 20:28:43 +0100
Message-ID: <61ee0726-7a5e-9596-b8bd-5ff29c3c0988@gmail.com>
References: <1485690751-4824-1-git-send-email-jacek.anaszewski@gmail.com>
 <20170129165606.GA7949@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33353 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751766AbdA2TaS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 29 Jan 2017 14:30:18 -0500
Received: by mail-wm0-f65.google.com with SMTP id v77so11395368wmv.0
        for <linux-leds@vger.kernel.org>; Sun, 29 Jan 2017 11:29:32 -0800 (PST)
In-Reply-To: <20170129165606.GA7949@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

On 01/29/2017 05:56 PM, Pavel Machek wrote:
> On Sun 2017-01-29 12:52:31, Jacek Anaszewski wrote:
>> LED subsystem supports POLLPRI on "brightness_hw_changed" sysfs file
>> of LED class devices. This tool demonstrates how to use the feature.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Hans de Goede <hdegoede@redhat.com>
> 
> I'd name it something shorter. We have "uledmon" so
> "led_hw_brightness_mon" is little out of place.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

I had the same doubts, but didn't finally manage to devise
something more concise. Feel free to propose better name.
For now I'm applying the patch as is. Thanks.

-- 
Best regards,
Jacek Anaszewski
