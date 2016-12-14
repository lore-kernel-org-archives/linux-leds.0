From: Milo Kim <woogyom.kim@gmail.com>
Subject: Re: [PATCH 4/5] firmware: add SmPL report for custom fallback
 mechanism
Date: Wed, 14 Dec 2016 10:48:37 +0900
Message-ID: <271c9d23-d35e-252b-d03b-651457112d28@gmail.com>
References: <20161213030828.17820-1-mcgrof@kernel.org>
 <CGME20161213030855epcas2p154c4db65f0d1e5b0c47979dc8500517d@epcas2p1.samsung.com>
 <20161213030828.17820-5-mcgrof@kernel.org>
 <10f8c7f7-a255-4830-65f0-a040d8236bf1@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:35129 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753149AbcLNBu3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Dec 2016 20:50:29 -0500
In-Reply-To: <10f8c7f7-a255-4830-65f0-a040d8236bf1@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, linux-leds@vger.k

Hi Jacek,

On 12/13/2016 06:44 PM, Jacek Anaszewski wrote:
>
> Could you please verify if leds-lp55xx-common.c driver
> really needs a custom firmware loading fallback mechanism?

Thanks for sharing this. The lp55xx-common uses this mechanism to load 
and run LED effect manually, so this could be a misuse case.
I think the right solution is providing device attributes.

At this moment, four drivers use lp55xx-common code.

- lp5521, lp5523: OK if we do not support FW loading fallback mechanism
- lp5562, lp8501: need to create additional sysfs alternatively.

However, we should be careful because I'm not sure this modification 
will generate the regression (breaking the user-space) or not.

Best regards,
Milo
