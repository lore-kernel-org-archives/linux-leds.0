From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 17/21] ARM: pxa: magician: Remove (temporarily) pasic3 LED support
Date: Sat, 22 Aug 2015 18:25:32 +0200
Message-ID: <87vbc747er.fsf@belgarion.home>
References: <cover.1439843482.git.petr.cvek@tul.cz> <55D25A74.3030902@tul.cz>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <55D25A74.3030902@tul.cz> (Petr Cvek's message of "Tue, 18 Aug
	2015 00:04:36 +0200")
Sender: linux-pm-owner@vger.kernel.org
To: Petr Cvek <petr.cvek@tul.cz>
Cc: philipp.zabel@gmail.com, daniel@zonque.org, haojian.zhuang@gmail.com, sameo@linux.intel.com, lee.jones@linaro.org, cooloney@gmail.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, linux@arm.linux.org.uk, sre@kernel.org, dbaryshkov@gmail.com, dwmw2@infradead.org, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-leds@vger.kernel.org

Petr Cvek <petr.cvek@tul.cz> writes:

> Temporarily remove pasic3 LEDs definition as it is not used (yet).
I don't understand the split between this patch and patch 19/21. Is it for
bisectability, are they symetric (this one removes what the next adds) ?

As the patch 18/21 will probably go through Lee's tree, is there any value in
keeping them apart ?

Cheers.

--
Robert
