From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Sample led driver dts file
Date: Thu, 28 Jul 2016 12:26:31 +0200
Message-ID: <5799DDD7.8010103@samsung.com>
References: <CAEwN+MBTMi29n30vC6SM=-_Db3WXxv_w81yrYZf0+Rcn=74eKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44312 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752686AbcG1K0g (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 28 Jul 2016 06:26:36 -0400
In-reply-to: <CAEwN+MBTMi29n30vC6SM=-_Db3WXxv_w81yrYZf0+Rcn=74eKg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Raul Piper <raulpblooper@gmail.com>
Cc: kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-leds@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On 07/28/2016 12:03 PM, Raul Piper wrote:
> Hi,
> Can any one please send me the sample led driver dts file.I tried the
> sample from the /documentation/devicetree/bindings/leds/<dts file> but

These are documentation files. Have you tried to check the build
instruction I mentioned in the previous reply?

> I am getting some parsing error from the dtc compiler.
> is "#" required while including the .dtsi file inside the dts while
> referring any include files.

Yes, it is. Please refer to the files in e.g. arch/arm/boot/dts.

> Also can we dynamically buil teh dts file and push/copy it to kernel?
> Reboot required?

Please direct your DT related questions to devicetree@vger.kernel.org.

-- 
Best regards,
Jacek Anaszewski
