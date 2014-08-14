From: Ran Shalit <ranshalit@gmail.com>
Subject: Fwd: sysfs alternative
Date: Thu, 14 Aug 2014 06:56:13 +0300
Message-ID: <CAJ2oMhJvAGbJZPk+w2QHxtS=PBQsYQ1woSY9Xm1m90E9uW1d9Q@mail.gmail.com>
References: <CAJ2oMhK9xDBkxhC-V01NGskicf=OZ0htLrs0dSbMwD0ziHXQow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:33482 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675AbaHND4N (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 13 Aug 2014 23:56:13 -0400
Received: by mail-qc0-f174.google.com with SMTP id l6so625025qcy.19
        for <linux-leds@vger.kernel.org>; Wed, 13 Aug 2014 20:56:13 -0700 (PDT)
In-Reply-To: <CAJ2oMhK9xDBkxhC-V01NGskicf=OZ0htLrs0dSbMwD0ziHXQow@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds <linux-leds@vger.kernel.org>

Hello,
Is it possible to control leds as ioctl, i.e. can I experimentally add
ioctl into led-class and set brightness for example through ioctl ?
The reason for this is that not all kernel use sysfs, therefore an
alternative for sysfs is required.

Thanks,
Ran
