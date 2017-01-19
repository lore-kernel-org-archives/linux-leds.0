From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH v4 2/2] firmware: add DECLARE_FW_CUSTOM_FALLBACK()
 annotation
Date: Thu, 19 Jan 2017 22:38:52 +0100
Message-ID: <20170119213852.GL13946@wotan.suse.de>
References: <20161213030828.17820-4-mcgrof@kernel.org>
 <20170112144250.12376-1-mcgrof@kernel.org>
 <20170112144250.12376-3-mcgrof@kernel.org>
 <20170119113111.GO28024@kroah.com>
 <20170119160825.GI13946@wotan.suse.de>
 <20170119161435.GA13166@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170119161435.GA13166@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, ming.lei@canonical.com, bp@alien8.de, wagi@monom.org, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, linux-leds@vger.k
List-Id: linux-leds@vger.kernel.org

On Thu, Jan 19, 2017 at 05:14:36PM +0100, Greg KH wrote:
> In short, don't worry about this, it's not a big deal nor really worth
> the effort.

Fine by me, I'll drop these two patches.

  Luis
