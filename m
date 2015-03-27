From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] DT: leds: Add uniqueness requirement for 'label' property.
Date: Thu, 26 Mar 2015 17:58:59 -0700
Message-ID: <CAK5ve-JdZR72VnADkK1s+M+yo=J3Q=_wXw5uU4Nu3SkJT8Nosg@mail.gmail.com>
References: <1427378590-24219-1-git-send-email-j.anaszewski@samsung.com> <55147317.8010009@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:34427 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752530AbbC0A7V (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Mar 2015 20:59:21 -0400
In-Reply-To: <55147317.8010009@iki.fi>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Thu, Mar 26, 2015 at 1:59 PM, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> Hi Jacek,
>
> Jacek Anaszewski wrote:
>> Label is used for naming LED class devices. Since ePAPR
>> doesn't require uniqueness for label properties, it has to be
>> explicitly required in the LEDs common bindings documentation.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> Cc: Bryan Wu <cooloney@gmail.com>
>> Cc: Richard Purdie <rpurdie@rpsys.net>
>> Cc: Sakari Ailus <sakari.ailus@iki.fi>
>> Cc: devicetree@vger.kernel.org
>
> Thanks for the patch!
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
Looks good to me, I will merge it.

-Bryan
