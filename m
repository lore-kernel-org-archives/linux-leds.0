From: Daniele Forsi <dforsi@gmail.com>
Subject: Re: [PATCH] leds: USB: Add support for MSI GT683R led panels
Date: Thu, 5 Jun 2014 16:19:02 +0200
Message-ID: <CAN_we7OQVcs7XHrfCA+k1DrNqY1=cGF_nuvT3q_sUDQXS-7xMg@mail.gmail.com>
References: <1401551204-6399-1-git-send-email-janne.kanniainen@gmail.com>
	<20140605110648.GA20679@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:34554 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751098AbaFEOTF (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 5 Jun 2014 10:19:05 -0400
In-Reply-To: <20140605110648.GA20679@localhost>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Janne Kanniainen <janne.kanniainen@gmail.com>, cooloney@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, USB list <linux-usb@vger.kernel.org>

2014-06-05 13:06 GMT+02:00:

>> +             dev_err(&led->usb_dev->dev, "Message to be send to device is too long\n");

there's a typo: s/send/sent/

-- 
Daniele Forsi
