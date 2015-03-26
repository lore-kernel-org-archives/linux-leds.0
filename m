From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] leds: start numerating duplicated devices from 2
Date: Thu, 26 Mar 2015 15:22:57 +0100
Message-ID: <CAPybu_2uPvZayywBuUbZ=JV7Fk5sBWeWqu3-AC35FcsA3kMXEg@mail.gmail.com>
References: <1427378590-24219-1-git-send-email-j.anaszewski@samsung.com> <1427378590-24219-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:32784 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751533AbbCZOXT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Mar 2015 10:23:19 -0400
Received: by labto5 with SMTP id to5so46937733lab.0
        for <linux-leds@vger.kernel.org>; Thu, 26 Mar 2015 07:23:17 -0700 (PDT)
In-Reply-To: <1427378590-24219-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Sakari Ailus <sakari.ailus@iki.fi>

Hello

I thought real programmers count from zero :), Jokes aside, I think it
is the convention in the kernel to start from 0 (video0, mmc0....)

Also the patch is wrong, it will always show the info message "led
renamed to...", becase led_classdev_register expects 0 when the device
has not been renamed, with this patch you will return 1.

Best Regards

Nacked-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

-- 
Ricardo Ribalda
