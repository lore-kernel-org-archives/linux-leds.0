From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/3] DT: leds: Add Qualcomm Light Pulse Generator
 binding
Date: Wed, 15 Nov 2017 23:09:09 -0600
Message-ID: <20171116050909.327m3q2bq7boikdl@rob-hp-laptop>
References: <20171115071345.24331-1-bjorn.andersson@linaro.org>
 <20171115071345.24331-4-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171115071345.24331-4-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Tue, Nov 14, 2017 at 11:13:45PM -0800, Bjorn Andersson wrote:
> This adds the binding document describing the three hardware blocks
> related to the Light Pulse Generator found in a wide range of Qualcomm
> PMICs.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> 
> Changes since v2:
> - Squashed all things into one node
> - Removed quirks from the binding, compatible implies number of channels, their
>   configuration etc.
> - Binding describes LEDs connected as child nodes
> - Support describing multi-channel LEDs
> - Change style of the binding document, to match other LED bindings
> 
> Changes since v1:
> - Dropped custom pattern properties
> - Renamed cell-index to qcom,lpg-channel to clarify its purpose
> 
>  .../devicetree/bindings/leds/leds-qcom-lpg.txt     | 66 ++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
