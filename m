From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
Date: Mon, 29 Apr 2019 08:03:02 -0700
Message-ID: <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
References: <20190429190354.0d5e2e93@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429190354.0d5e2e93@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marek Behun <marek.behun@nic.cz>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 4/29/19 2:03 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190426:
> 

on i386:

when CONFIG_LEDS_TURRIS_OMNIA=y and CONFIG_I2C=m:

Probably should also depend on I2C.


ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_remove':
leds-turris-omnia.c:(.text+0xb): undefined reference to `i2c_smbus_write_byte_data'
ld: drivers/leds/leds-turris-omnia.o: in function `omnia_led_brightness_set_blocking':
leds-turris-omnia.c:(.text+0x62): undefined reference to `i2c_smbus_write_byte_data'
ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_probe':
leds-turris-omnia.c:(.text+0x1d8): undefined reference to `i2c_smbus_write_byte_data'
ld: leds-turris-omnia.c:(.text+0x1f6): undefined reference to `i2c_smbus_write_byte_data'
ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_driver_init':
leds-turris-omnia.c:(.init.text+0x8): undefined reference to `i2c_register_driver'
ld: drivers/leds/leds-turris-omnia.o: in function `omnia_leds_driver_exit':
leds-turris-omnia.c:(.exit.text+0x6): undefined reference to `i2c_del_driver'



-- 
~Randy
