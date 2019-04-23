From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 61/79] docs: leds: convert to ReST
Date: Tue, 23 Apr 2019 21:00:16 +0200
Message-ID: <a8d307d2-04c7-d63e-54a4-5082217e38e8@gmail.com>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
 <c8da7b666a127687471f38cbb5edc12d44814009.1555938376.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8da7b666a127687471f38cbb5edc12d44814009.1555938376.git.mchehab+samsung@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Vadim Pasternak <vadimp@mellanox.com>, Pavel Machek <pavel@ucw.cz>, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, linux-leds@vger.kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Mauro,

Thank you for your effort.

On 4/22/19 3:27 PM, Mauro Carvalho Chehab wrote:
> Rename the leds documentation files to ReST, add an
> index for them and adjust in order to produce a nice html
> output via the Sphinx build system.
> 
> At its new index.rst, let's add a :orphan: while this is not linked to
> the main index.rst file, in order to avoid build warnings.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>   Documentation/laptops/thinkpad-acpi.txt       |   4 +-
>   Documentation/leds/index.rst                  |  25 ++
>   .../leds/{leds-blinkm.txt => leds-blinkm.rst} |  63 ++---
>   ...s-class-flash.txt => leds-class-flash.rst} |  49 ++--
>   .../leds/{leds-class.txt => leds-class.rst}   |  15 +-
>   .../leds/{leds-lm3556.txt => leds-lm3556.rst} | 100 ++++++--
>   .../leds/{leds-lp3944.txt => leds-lp3944.rst} |  23 +-
>   Documentation/leds/leds-lp5521.rst            | 115 +++++++++
>   Documentation/leds/leds-lp5521.txt            | 101 --------
>   Documentation/leds/leds-lp5523.rst            | 147 ++++++++++++
>   Documentation/leds/leds-lp5523.txt            | 130 ----------
>   Documentation/leds/leds-lp5562.rst            | 137 +++++++++++
>   Documentation/leds/leds-lp5562.txt            | 120 ----------
>   Documentation/leds/leds-lp55xx.rst            | 224 ++++++++++++++++++
>   Documentation/leds/leds-lp55xx.txt            | 194 ---------------
>   Documentation/leds/leds-mlxcpld.rst           | 118 +++++++++
>   Documentation/leds/leds-mlxcpld.txt           | 110 ---------
>   ...edtrig-oneshot.txt => ledtrig-oneshot.rst} |  11 +-
>   ...ig-transient.txt => ledtrig-transient.rst} |  63 +++--
>   ...edtrig-usbport.txt => ledtrig-usbport.rst} |  11 +-
>   Documentation/leds/{uleds.txt => uleds.rst}   |   5 +-
>   MAINTAINERS                                   |   2 +-
>   drivers/leds/trigger/Kconfig                  |   2 +-
>   drivers/leds/trigger/ledtrig-transient.c      |   2 +-
>   net/netfilter/Kconfig                         |   2 +-
>   25 files changed, 996 insertions(+), 777 deletions(-)
>   create mode 100644 Documentation/leds/index.rst
>   rename Documentation/leds/{leds-blinkm.txt => leds-blinkm.rst} (56%)
>   rename Documentation/leds/{leds-class-flash.txt => leds-class-flash.rst} (74%)
>   rename Documentation/leds/{leds-class.txt => leds-class.rst} (92%)
>   rename Documentation/leds/{leds-lm3556.txt => leds-lm3556.rst} (70%)
>   rename Documentation/leds/{leds-lp3944.txt => leds-lp3944.rst} (78%)
>   create mode 100644 Documentation/leds/leds-lp5521.rst
>   delete mode 100644 Documentation/leds/leds-lp5521.txt
>   create mode 100644 Documentation/leds/leds-lp5523.rst
>   delete mode 100644 Documentation/leds/leds-lp5523.txt
>   create mode 100644 Documentation/leds/leds-lp5562.rst
>   delete mode 100644 Documentation/leds/leds-lp5562.txt
>   create mode 100644 Documentation/leds/leds-lp55xx.rst
>   delete mode 100644 Documentation/leds/leds-lp55xx.txt
>   create mode 100644 Documentation/leds/leds-mlxcpld.rst
>   delete mode 100644 Documentation/leds/leds-mlxcpld.txt
>   rename Documentation/leds/{ledtrig-oneshot.txt => ledtrig-oneshot.rst} (90%)
>   rename Documentation/leds/{ledtrig-transient.txt => ledtrig-transient.rst} (81%)
>   rename Documentation/leds/{ledtrig-usbport.txt => ledtrig-usbport.rst} (86%)
>   rename Documentation/leds/{uleds.txt => uleds.rst} (95%)
> 
> diff --git a/Documentation/laptops/thinkpad-acpi.txt b/Documentation/laptops/thinkpad-acpi.txt
> index 3de3c95f01f6..65719384fc36 100644

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
