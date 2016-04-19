From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v2 3/3] leds: gpio: Support the "panic-indicator" firmware property
Date: Tue, 19 Apr 2016 13:18:36 -0300
Message-ID: <CAAEAJfA6O8QV0zk9vnHwePaB7BFgtDVaAsTOm=LVh22eS6Lccg@mail.gmail.com>
References: <1460570899-24642-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<1460570899-24642-4-git-send-email-ezequiel@vanguardiasur.com.ar>
	<570F5B6B.3000702@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:34820 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932826AbcDSQSi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 19 Apr 2016 12:18:38 -0400
Received: by mail-wm0-f45.google.com with SMTP id e201so20152035wme.0
        for <linux-leds@vger.kernel.org>; Tue, 19 Apr 2016 09:18:37 -0700 (PDT)
In-Reply-To: <570F5B6B.3000702@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>

Hi Jacek,

On 14 April 2016 at 05:57, Jacek Anaszewski <j.anaszewski@samsung.com> =
wrote:
> Hi Ezequiel,
>
> It would be good to update also leds-gpio bindings,
> of course in a separate patch:
>
> Documentation/devicetree/bindings/leds/leds-gpio.txt
>

Yes, you are right. I will send a new series adding this.

Thanks,
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
