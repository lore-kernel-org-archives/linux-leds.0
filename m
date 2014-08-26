From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH][input-led] Defer input led work to workqueue
Date: Tue, 26 Aug 2014 10:01:35 +0200
Message-ID: <1409040095.2489.3.camel@jlt4.sipsolutions.net>
References: <20140826015453.GA5235@type.youpi.perso.aquilenet.fr>
	 (sfid-20140826_040254_816162_A52F1B31)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140826015453.GA5235@type.youpi.perso.aquilenet.fr> (sfid-20140826_040254_816162_A52F1B31)
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Hugh Dickins <hughd@google.com>, akpm@linux-foundation.org, Sabrina Dubroca <sd@queasysnail.net>, Valdis.Kletnieks@vt.edu, Vincent Donnefort <vdonnefort@gmail.com>, Bryan Wu <cooloney@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, 2014-08-26 at 03:54 +0200, Samuel Thibault wrote:

> +	vt_led_wq = alloc_workqueue("input_leds", WQ_UNBOUND, 0);
> +	if (!vt_led_wq)
> +		return -ENOMEM;

Does this really need a separate workqueue rather than just using
schedule_work()? There doesn't seem to be much point in having its own
workqueue really, to me.

johannes
