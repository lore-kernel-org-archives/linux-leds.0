From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 24/43] docs: leds: convert to ReST
Date: Fri, 28 Jun 2019 21:01:40 +0200
Message-ID: <0b2a2452-20ca-1651-e03b-a15a8502b028@gmail.com>
References: <cover.1561723979.git.mchehab+samsung@kernel.org>
 <2fecbe9a9cefda64771b43c5fc67495d897dd722.1561723980.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2fecbe9a9cefda64771b43c5fc67495d897dd722.1561723980.git.mchehab+samsung@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Vadim Pasternak <vadimp@mellanox.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, linux-leds@vger.kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Mauro,

On 6/28/19 2:20 PM, Mauro Carvalho Chehab wrote:
> Rename the leds documentation files to ReST, add an
> index for them and adjust in order to produce a nice html
> output via the Sphinx build system.
> 
> At its new index.rst, let's add a :orphan: while this is not linked to
> the main index.rst file, in order to avoid build warnings.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  Documentation/laptops/thinkpad-acpi.txt       |   4 +-
>  Documentation/leds/index.rst                  |  25 ++
>  .../leds/{leds-blinkm.txt => leds-blinkm.rst} |  64 ++---
>  ...s-class-flash.txt => leds-class-flash.rst} |  49 ++--
>  .../leds/{leds-class.txt => leds-class.rst}   |  15 +-
>  .../leds/{leds-lm3556.txt => leds-lm3556.rst} | 100 ++++++--
>  .../leds/{leds-lp3944.txt => leds-lp3944.rst} |  23 +-
>  Documentation/leds/leds-lp5521.rst            | 115 +++++++++
>  Documentation/leds/leds-lp5521.txt            | 101 --------
>  Documentation/leds/leds-lp5523.rst            | 147 ++++++++++++
>  Documentation/leds/leds-lp5523.txt            | 130 ----------
>  Documentation/leds/leds-lp5562.rst            | 137 +++++++++++
>  Documentation/leds/leds-lp5562.txt            | 120 ----------
>  Documentation/leds/leds-lp55xx.rst            | 224 ++++++++++++++++++
>  Documentation/leds/leds-lp55xx.txt            | 194 ---------------
>  Documentation/leds/leds-mlxcpld.rst           | 118 +++++++++
>  Documentation/leds/leds-mlxcpld.txt           | 110 ---------
>  ...edtrig-oneshot.txt => ledtrig-oneshot.rst} |  11 +-
>  ...ig-transient.txt => ledtrig-transient.rst} |  63 +++--
>  ...edtrig-usbport.txt => ledtrig-usbport.rst} |  11 +-
>  Documentation/leds/{uleds.txt => uleds.rst}   |   5 +-
>  MAINTAINERS                                   |   2 +-
>  drivers/leds/trigger/Kconfig                  |   2 +-
>  drivers/leds/trigger/ledtrig-transient.c      |   2 +-
>  net/netfilter/Kconfig                         |   2 +-
>  25 files changed, 996 insertions(+), 778 deletions(-)
>  create mode 100644 Documentation/leds/index.rst
>  rename Documentation/leds/{leds-blinkm.txt => leds-blinkm.rst} (57%)
>  rename Documentation/leds/{leds-class-flash.txt => leds-class-flash.rst} (74%)
>  rename Documentation/leds/{leds-class.txt => leds-class.rst} (92%)
>  rename Documentation/leds/{leds-lm3556.txt => leds-lm3556.rst} (70%)
>  rename Documentation/leds/{leds-lp3944.txt => leds-lp3944.rst} (78%)
>  create mode 100644 Documentation/leds/leds-lp5521.rst
>  delete mode 100644 Documentation/leds/leds-lp5521.txt
>  create mode 100644 Documentation/leds/leds-lp5523.rst
>  delete mode 100644 Documentation/leds/leds-lp5523.txt
>  create mode 100644 Documentation/leds/leds-lp5562.rst
>  delete mode 100644 Documentation/leds/leds-lp5562.txt
>  create mode 100644 Documentation/leds/leds-lp55xx.rst
>  delete mode 100644 Documentation/leds/leds-lp55xx.txt
>  create mode 100644 Documentation/leds/leds-mlxcpld.rst
>  delete mode 100644 Documentation/leds/leds-mlxcpld.txt
>  rename Documentation/leds/{ledtrig-oneshot.txt => ledtrig-oneshot.rst} (90%)
>  rename Documentation/leds/{ledtrig-transient.txt => ledtrig-transient.rst} (81%)
>  rename Documentation/leds/{ledtrig-usbport.txt => ledtrig-usbport.rst} (86%)
>  rename Documentation/leds/{uleds.txt => uleds.rst} (95%)

Patches 4/9 and 24/43 applied to the for-next branch of linux-leds.git.

Thanks!

-- 
Best regards,
Jacek Anaszewski
