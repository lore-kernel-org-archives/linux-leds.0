From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v2 2/2] leds: add Qualcomm PM8941 WLED driver
Date: Fri, 23 Jan 2015 17:22:29 -0800
Message-ID: <CAJAp7OgpF2-b5zWJ-_z_yPejPO8LFZpT7dD7h0Wo3X5wV5xBjw@mail.gmail.com>
References: <1422060853-1067-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Jan 23, 2015 at 4:54 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> From: Courtney Cavin <courtney.cavin@sonymobile.com>
>
> This adds support for the WLED ('White' LED) block on Qualcomm's
> PM8941 PMICs.
>
> Signed-off-by: Courtney Cavin <courtney.cavin@sonymobile.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---

Sorry, I missed the change log.

Changed since v1:
* Replace enum blob with defines
* Merged wled_context and wled structs
* Some style updates

Regards,
Bjorn
