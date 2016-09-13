From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: linux-next: Tree for Sep 12 (leds/leds-mlxcpld.c)
Date: Tue, 13 Sep 2016 09:12:26 +0200
Message-ID: <b7750571-77d4-cc10-3fd6-364cc9869040@samsung.com>
References: <20160912154216.724eb884@canb.auug.org.au>
 <CGME20160912170143eucas1p14f9050dc4bd8a2793b7b03089970eadc@eucas1p1.samsung.com>
 <14fc21ba-9658-4c6d-fe3e-2c87a02f377c@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:28242 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754450AbcIMHMd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Sep 2016 03:12:33 -0400
In-reply-to: <14fc21ba-9658-4c6d-fe3e-2c87a02f377c@infradead.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>, linux-leds@vger.kernel.org

Hi Randy,

On 09/12/2016 07:01 PM, Randy Dunlap wrote:
> On 09/11/16 22:42, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20160909:
>>
>
> on x86_64:
>
> ../drivers/leds/leds-mlxcpld.c: In function 'mlxcpld_led_bus_access_func':
> ../drivers/leds/leds-mlxcpld.c:253:3: error: implicit declaration of function 'outb' [-Werror=implicit-function-declaration]
>    outb(*data, addr);
>    ^
> ../drivers/leds/leds-mlxcpld.c:255:3: error: implicit declaration of function 'inb' [-Werror=implicit-function-declaration]
>    *data = inb(addr);
>    ^

Thanks for the report. Fixed the issues along with three other
sparse warnings.

-- 
Best regards,
Jacek Anaszewski
