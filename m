From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 15/21] ARM: pxa: magician: Fix PWM backlight regulator
Date: Thu, 20 Aug 2015 21:58:25 +0200
Message-ID: <87d1yh68bi.fsf@belgarion.home>
References: <cover.1439843482.git.petr.cvek@tul.cz> <55D25A4A.4070409@tul.cz>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <55D25A4A.4070409@tul.cz> (Petr Cvek's message of "Tue, 18 Aug
	2015 00:03:54 +0200")
Sender: linux-pm-owner@vger.kernel.org
To: Petr Cvek <petr.cvek@tul.cz>
Cc: philipp.zabel@gmail.com, daniel@zonque.org, haojian.zhuang@gmail.com, sameo@linux.intel.com, lee.jones@linaro.org, cooloney@gmail.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, linux@arm.linux.org.uk, sre@kernel.org, dbaryshkov@gmail.com, dwmw2@infradead.org, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-leds@vger.kernel.org

Petr Cvek <petr.cvek@tul.cz> writes:

> Fix PWM backlight regulator. It is requested from pwm_backlight_probe().
Even if I know why you have to fix it, somebody else reading your commit message
should understand why this fix is need. You need to explain why it is needed,
ie. what happens without it, and therefore what justifies this patch.

Cheers.

--
Robert

PS: For inspiration, look at Thierry's commit 902e6a0c7eba.
