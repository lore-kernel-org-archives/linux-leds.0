From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/5] dt-bindings: leds: Add pattern initialization
 from Device Tree
Date: Tue, 15 Jan 2019 14:03:36 -0600
Message-ID: <20190115200336.GA14333@bogus>
References: <1547045089-19128-1-git-send-email-krzk@kernel.org>
 <1547045089-19128-2-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547045089-19128-2-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-leds@vger.kernel.org

On Wed,  9 Jan 2019 15:44:45 +0100, Krzysztof Kozlowski wrote:
> Document new led-pattern property for initialization of LED triggers.
> The property format is trigger-specific (except being array of
> integers).  For pattern trigger, the explanation of pattern format was
> moved to a common file shared with sysfs ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  .../ABI/testing/sysfs-class-led-trigger-pattern    | 51 ++--------------------
>  Documentation/devicetree/bindings/leds/common.txt  | 12 +++++
>  .../bindings/leds/leds-trigger-pattern.txt         | 49 +++++++++++++++++++++
>  3 files changed, 64 insertions(+), 48 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
