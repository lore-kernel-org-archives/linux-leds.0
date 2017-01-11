From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 4/5] firmware: add SmPL report for custom fallback
 mechanism
Date: Wed, 11 Jan 2017 09:32:26 +0100
Message-ID: <20170111083226.GA26154@kroah.com>
References: <20161216111038.22064-1-mcgrof@kernel.org>
 <20161216111038.22064-5-mcgrof@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161216111038.22064-5-mcgrof@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri, Dec 16, 2016 at 03:10:37AM -0800, Luis R. Rodriguez wrote:
> Even though most distributions today disable the fallback mechanism
> by default we've determined that we cannot remove them from the kernel.
> This is not well understood so document the reason and logic behind that.

Well, the biggest reason is that some distros still rely on this.  I've
seen new products being made that rely on it, so let's please stop
treating it like it is somehow a "deprecated" interface.  We can't get
rid of it, so we just have to live with it, for forever, sorry.

greg k-h
