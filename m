From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] devicetree: leds: Introduce "panic-indicator"
 optional property
Date: Thu, 14 Apr 2016 11:33:57 -0500
Message-ID: <20160414163357.GA21964@rob-hp-laptop>
References: <1460570899-24642-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460570899-24642-3-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460570899-24642-3-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>
List-Id: linux-leds@vger.kernel.org

On Wed, Apr 13, 2016 at 03:08:18PM -0300, Ezequiel Garcia wrote:
> It's desirable to specify which LEDs are to be blinked on a kernel
> panic. Therefore, introduce a devicetree boolean property to mark
> which LEDs should be treated this way, if possible.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <rob@kernel.org>
