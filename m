From: Marek Behun <marek.behun@nic.cz>
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
Date: Mon, 29 Apr 2019 18:44:39 +0200
Message-ID: <20190429184439.68049050@nic.cz>
References: <20190429190354.0d5e2e93@canb.auug.org.au>
        <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
        <20190429153200.GA11761@amd>
        <20190429173842.06f02852@nic.cz>
        <20190429163753.GA16782@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429163753.GA16782@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, 29 Apr 2019 18:37:53 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> On Mon 2019-04-29 17:38:42, Marek Behun wrote:
> > I am sending patch only adding the I2C dep. Theoretically it is
> > possible that someone uses the same I2C API in their microcontroller on
> > another architecture.  
> 
> Theoretically. But we both now that probability of that is very low,
> and that likely driver would need other updates, too... right?
> 
> 								Pavel

What would be the benefit to add ARM dependency? So that distro
compilations don't ship the turris_omnia driver unnecesarily?
