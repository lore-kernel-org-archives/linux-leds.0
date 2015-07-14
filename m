From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH/RFC v3 0/7] Remove work queues from LED class drivers
Date: Tue, 14 Jul 2015 16:23:50 +0200
Message-ID: <55A51B76.4030603@samsung.com>
References: <1435929052-8736-1-git-send-email-j.anaszewski@samsung.com>
 <20150714141024.GC10671@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28956 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751968AbbGNOX4 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 14 Jul 2015 10:23:56 -0400
In-reply-to: <20150714141024.GC10671@kw.sim.vm.gnt>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, pavel@ucw.cz, sakari.ailus@linux.intel.com, andreas.werner@men.de, andrew@lunn.ch, ospite@studenti.unina.it, anemo@mba.ocn.ne.jp, ben@simtec.co.uk, bootc@bootc.net, dmurphy@ti.com, daniel.jeong@ti.com, daniel@zonque.org, davem@davemloft.net, fabio.baltieri@gmail.com, balbi@ti.com, florian@openwrt.org, gshark.jeong@gmail.com, g.liakhovetski@gmx.de, ingi2.kim@samsung.com, dl9pf@gmx.de, johan@kernel.org, lenz@cs.wisc.edu, jogo@openwrt.org, q1.kim@samsung.com, kris@krisk.org, kristoffer.ericson@gmail.com, linus.walleij@linaro.org, broonie@kernel.org, michael.hennerich@analog.com, milo.kim@ti.com, nm127@freemail.hu, ncase@xes-inc.com, neilb@suse.de, nick.forbes@incepta.com, lost.distance@yahoo.com, p.meerwald@bct-electronic.com, n0-1@freewrt.org, phil

Hi Simon,

On 07/14/2015 04:10 PM, Simon Guinot wrote:
[...]

files changed, 124 insertions(+), 225 deletions(-)
>
> Hi Jacek,
>
> I have successfully tested this patch set with both the leds-ns2 and
> leds-netxbig drivers and with either sleeping and non-sleeping GPIOs
> LEDs.
>
> Tested-by: Simon Guinot <simon.guinot@sequanux.org>

Thanks for the feedback.

> Note that you may want to get rid of the comment
> "Must not sleep, use a workqueue if needed" above the member
> brightness_set in struct led_classdev.

Right, thanks.

-- 
Best Regards,
Jacek Anaszewski
