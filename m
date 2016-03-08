From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: Re: [PATCH 0/7] leds: Use devm_led_classdev_register
Date: Tue, 8 Mar 2016 18:12:31 +0530
Message-ID: <CA+5yK5HjNEC1xZimtGc1+EA0aRkn16DSHxS=-Xrs3ZZqnUjp2A@mail.gmail.com>
References: <cover.1457355135.git.amitoj1606@gmail.com>
	<56DE8C9E.1000400@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f66.google.com ([209.85.192.66]:36481 "EHLO
	mail-qg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751307AbcCHMmc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 8 Mar 2016 07:42:32 -0500
In-Reply-To: <56DE8C9E.1000400@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On Tue, Mar 8, 2016 at 1:56 PM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> Hi Amitoj,
>
> Thanks for the patches.
>
> Applied only the 7/7 one. In the remaining ones, please remove
> also all occurrences of platform_set_drvdata() in the probe()
> and pdev_to_gpio() definition from leds-s3c24xx.cm as they will
> be no longer required.

Okay, thanks for the feedback. Will do.

Amitoj
