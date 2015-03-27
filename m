From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v3] led/led-class: Handle LEDs with the same name
Date: Fri, 27 Mar 2015 10:24:53 -0700
Message-ID: <CAK5ve-KLmETc1Ym1xvwTuvG7f5O1w6s=u3fgdGcYT8GHCWT+VA@mail.gmail.com>
References: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
 <20150326233025.GR18321@valkosipuli.retiisi.org.uk> <CAPybu_1thjCfz3Xomzpvc3Hpw2j_z8rXpmp28WnuRBDE0DYAtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:37986 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750931AbbC0RZO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Mar 2015 13:25:14 -0400
In-Reply-To: <CAPybu_1thjCfz3Xomzpvc3Hpw2j_z8rXpmp28WnuRBDE0DYAtA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Wu Fengguang <fengguang.wu@intel.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christopher Li <sparse@chrisli.org>

On Fri, Mar 27, 2015 at 1:09 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hi Sakari
>
> cc: adding Greg (core and FormatGuard) and Chistopher (sparse)
>>
>> I just realised there was another issue --- the name is now interpreted as
>> format string. Bad things will happen if there's e.g. %s in the name itself
>> --- perhaps unlikely, but possible.
>
> Good catch!
>
> Would it be possible to add a sparse check to avoid this in all the kernel?
>
> And what about a macro protection like FormatGuard?
>
> https://www.usenix.org/legacy/events/sec01/full_papers/cowanbarringer/cowanbarringer.pdf
>
>

I think Fengguang's 0-DAY kernel test infrastructure can help this.
-Bryan
