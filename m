From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 12 (leds/leds-mlxcpld.c)
Date: Mon, 12 Sep 2016 10:01:35 -0700
Message-ID: <14fc21ba-9658-4c6d-fe3e-2c87a02f377c@infradead.org>
References: <20160912154216.724eb884@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160912154216.724eb884@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 09/11/16 22:42, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160909:
> 

on x86_64:

../drivers/leds/leds-mlxcpld.c: In function 'mlxcpld_led_bus_access_func':
../drivers/leds/leds-mlxcpld.c:253:3: error: implicit declaration of function 'outb' [-Werror=implicit-function-declaration]
   outb(*data, addr);
   ^
../drivers/leds/leds-mlxcpld.c:255:3: error: implicit declaration of function 'inb' [-Werror=implicit-function-declaration]
   *data = inb(addr);
   ^



-- 
~Randy
