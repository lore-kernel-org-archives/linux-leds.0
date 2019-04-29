From: Marek Behun <marek.behun@nic.cz>
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
Date: Mon, 29 Apr 2019 21:02:21 +0200
Message-ID: <20190429210221.6e6c207e@nic.cz>
References: <20190429190354.0d5e2e93@canb.auug.org.au>
        <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
        <20190429153200.GA11761@amd>
        <20190429173842.06f02852@nic.cz>
        <20190429163753.GA16782@amd>
        <20190429184439.68049050@nic.cz>
        <20190429165319.GB16782@amd>
        <c045db7f-2147-1a58-8d65-8b52fddd932c@metux.net>
        <20190429181245.GA24658@amd>
        <ccf6596b-e645-a9b3-dfab-96ff14e8b70d@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ccf6596b-e645-a9b3-dfab-96ff14e8b70d@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Pavel Machek <pavel@ucw.cz>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, 29 Apr 2019 20:49:59 +0200
"Enrico Weigelt, metux IT consult" <lkml@metux.net> wrote:

> On 29.04.19 20:12, Pavel Machek wrote:
> 
> >> Is that controller only built-in into some SoCs, or also available
> >> as a separate chip ?  
> > 
> > AFAIU.. separate chip, but runs firmware not likely to be available
> > outside Turris routers.  
> 
> hmm, if it's a separate chip, IMHO it should be selectable, so that
> anybody who puts that chip on his board can directly use it.
> 
> --mtx
> 

The chip is a cortex-m3 or something like that. What makes the LEDs
work in this specific way this driver uses is the firmware on the chip,
and that firmware is specific for Omnia.

It is possible that in the future someone makes a I2C controller
compatible with the API the Omnia firmware provides, but very unlikely.

I think it is reasonable to make the driver depend on MACH_ARMADA_38X
and in the unlikely scenario that someone makes a compatible
controller, the dependency can always be removed.

Marek
situation it is possible to 
