From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: leds-pwm: issue in  __led_pwm_set()
Date: Wed, 25 Sep 2013 22:00:13 +0200
Message-ID: <524340CD.4060403@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:39859 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751315Ab3IYUAQ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 25 Sep 2013 16:00:16 -0400
Received: from [192.168.1.55] (128-79-216-144.hfc.dyn.abo.bbox.fr [128.79.216.144])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 896DA8B1
	for <linux-leds@vger.kernel.org>; Wed, 25 Sep 2013 22:00:19 +0200 (CEST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

Hi,

I'm using leds-pwm on an atmel sama5d31 based board. I have one
question/issue. In __led_pwm_set(), if the duty cycle is 0,
pwm_disable() is called. This won't work fine on that platform. What
happens is that pwm_config() correctly sets the duty cycle to 0 which is
behaving correctly with that controller (and in my case, putting the
line low). But the call to pwm_disable() is making the pwm controller
release the line and then it is set to high.

I've tried various configurations, like configuring a pull-down on the
pin but I still observe the same behavior. For now, I have a workaround
in atmel-pwm (I activate the output overdrive when duty cycle is 0). But
I believe, we should find another way to do that.

Any input is appreciated.

Regards,

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

