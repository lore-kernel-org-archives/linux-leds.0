From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 0/3] leds/class: Fix string handling
Date: Mon, 30 Mar 2015 10:15:20 -0700
Message-ID: <CAK5ve-LyQx6s53+kuh7h0mAwFrz65i-z2nf82dsme=Y-Uk7p7g@mail.gmail.com>
References: <1427705712-18083-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:36114 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752587AbbC3RPl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Mar 2015 13:15:41 -0400
In-Reply-To: <1427705712-18083-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

On Mon, Mar 30, 2015 at 1:55 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Fix errors reported by Geert Uytterhoeven.
>
> I didn't have the chance to test the changes it in real hardware.
>
>

Thanks, Geert and Ricardo.
Ricardo, do you mind folding your fixing patches with original one
together and send it out again? I will use the new one to replace that
one in my tree, since this patch is not merged into Linus tree yet.

-Bryan


> Ricardo Ribalda Delgado (3):
>   leds/class: Use strlcpy instead of strncpy
>   leds/class: Check snprintf return value
>   leds/class: Set naming index as unsigned
>
>  drivers/leds/led-class.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> --
> 2.1.4
>
