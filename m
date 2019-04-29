From: Marek Behun <marek.behun@nic.cz>
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
Date: Mon, 29 Apr 2019 17:38:42 +0200
Message-ID: <20190429173842.06f02852@nic.cz>
References: <20190429190354.0d5e2e93@canb.auug.org.au>
 <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
 <20190429153200.GA11761@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429153200.GA11761@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

I am sending patch only adding the I2C dep. Theoretically it is
possible that someone uses the same I2C API in their microcontroller on
another architecture.

On Mon, 29 Apr 2019 17:32:00 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> On Mon 2019-04-29 08:03:02, Randy Dunlap wrote:
> > On 4/29/19 2:03 AM, Stephen Rothwell wrote:  
> > > Hi all,
> > > 
> > > Changes since 20190426:
> > >   
> > 
> > on i386:
> > 
> > when CONFIG_LEDS_TURRIS_OMNIA=y and CONFIG_I2C=m:
> > 
> > Probably should also depend on I2C.
> > 
> > 
> > ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_remove':
> > leds-turris-omnia.c:(.text+0xb): undefined reference to `i2c_smbus_write_byte_data'
> > ld: drivers/leds/leds-turris-omnia.o: in function `omnia_led_brightness_set_blocking':
> > leds-turris-omnia.c:(.text+0x62): undefined reference to `i2c_smbus_write_byte_data'
> > ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_probe':
> > leds-turris-omnia.c:(.text+0x1d8): undefined reference to `i2c_smbus_write_byte_data'
> > ld: leds-turris-omnia.c:(.text+0x1f6): undefined reference to `i2c_smbus_write_byte_data'
> > ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_driver_init':
> > leds-turris-omnia.c:(.init.text+0x8): undefined reference to `i2c_register_driver'
> > ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_driver_exit':
> > leds-turris-omnia.c:(.exit.text+0x6): undefined reference to `i2c_del_driver'  
> 
> Ack.
> 
> It can also depend on ARM or even specific ARM soc... unless we are
> compile testing. This is for specific router...
> 
> 									Pavel
