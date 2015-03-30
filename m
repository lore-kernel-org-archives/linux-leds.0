From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 0/3] Handle LEDs with the same name
Date: Mon, 30 Mar 2015 15:08:01 -0700
Message-ID: <CAK5ve-+fd-akCiCENfCvdU9x79g=q2b3gat2h8Zao64ciDbymw@mail.gmail.com>
References: <1427737561-2424-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:36672 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092AbbC3WIX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Mar 2015 18:08:23 -0400
In-Reply-To: <1427737561-2424-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, sakari.ailus@linux.intel.com, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On Mon, Mar 30, 2015 at 10:45 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> This is a rework of the original patch + 3 fixup patches from me.
> Contains a lot of feedback from Geert Uytterhoeven <geert@linux-m68k.org>
> Thanks!
>
> Ricardo Ribalda Delgado (1):
>   leds/led-class: Handle LEDs with the same name
>
> Sakari Ailus (2):
>   leds: Use log level warn instead of info when telling about a name
>     clash
>   leds: Don't treat the LED name as a format string
>
>  drivers/leds/led-class.c | 39 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
>
Applied again.

Thanks,
-Bryan
