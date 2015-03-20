From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v3 1/3] of: Add vendor prefix for Kinetic technologies
Date: Fri, 20 Mar 2015 10:46:48 -0500
Message-ID: <CAL_JsqJUDQxnQ2YeaEULD3FgF=7byaD=-etdzdBMT76dE_9hOw@mail.gmail.com>
References: <1426829466-13559-1-git-send-email-ingi2.kim@samsung.com> <1426829466-13559-2-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426829466-13559-2-git-send-email-ingi2.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Sakari Ailus <sakari.ailus@iki.fi>, Jacek Anaszewski <j.anaszewski@samsung.com>, Varka Bhadram <varkabhadram@gmail.com>, sw0312.kim@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Inha Song <ideal.song@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri, Mar 20, 2015 at 12:31 AM, Ingi Kim <ingi2.kim@samsung.com> wrote:
> This patch adds vendor prefix for Kinetic technologies
>
> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index fae26d0..90a4be1 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -100,6 +100,7 @@ isee        ISEE 2007 S.L.
>  isil   Intersil
>  karo   Ka-Ro electronics GmbH
>  keymile        Keymile GmbH
> +kinetic Kinetic Technologies
>  lacie  LaCie
>  lantiq Lantiq Semiconductor
>  lenovo Lenovo Group Ltd.
> --
> 2.0.5
>
