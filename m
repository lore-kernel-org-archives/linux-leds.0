From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Fri, 16 Dec 2016 11:56:48 +0100
Message-ID: <20161216105648.GT13946@wotan.suse.de>
References: <20161213030828.17820-1-mcgrof@kernel.org>
 <20161213030828.17820-6-mcgrof@kernel.org>
 <20161213190429.GC8676@amd>
 <20161216092241.GO13946@wotan.suse.de>
 <20161216092919.GA26091@amd>
 <20161216095906.GS13946@wotan.suse.de>
 <20161216101405.GA29069@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50400 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1760767AbcLPK5G (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Dec 2016 05:57:06 -0500
Content-Disposition: inline
In-Reply-To: <20161216101405.GA29069@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaur

On Fri, Dec 16, 2016 at 11:14:05AM +0100, Pavel Machek wrote:
> 
> Well, I was asking if the above snipped looks like valid use. Because
> AFAICT, the "custom fallback" is just dev_err(), see above. Coccinelle
> rules don't help me...

Its not. Its when you ask for no uevent. Only 2 drivers do this.

  Luis
