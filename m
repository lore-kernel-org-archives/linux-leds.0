From: kgunda@codeaurora.org
Subject: Re: [PATCH V4 3/8] backlight: qcom-wled: Add new properties for
 PMI8998
Date: Wed, 26 Sep 2018 11:01:46 +0530
Message-ID: <0e127bf34934236d0147bd23a0b400a9@codeaurora.org>
References: <1531131741-19971-1-git-send-email-kgunda@codeaurora.org>
 <1531131741-19971-4-git-send-email-kgunda@codeaurora.org>
 <20180807052355.GA23866@tuxbook-pro>
 <897ab82c450bff71658c1fa32e7e6021@codeaurora.org>
 <20180903185510.GB3153@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903185510.GB3153@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: jingoohan1@gmail.com, lee.jones@linaro.org, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 2018-09-04 00:25, Bjorn Andersson wrote:
> On Wed 15 Aug 22:23 PDT 2018, kgunda@codeaurora.org wrote:
> 
>> On 2018-08-07 10:53, Bjorn Andersson wrote:
>> > On Mon 09 Jul 03:22 PDT 2018, Kiran Gunda wrote:
>> > > diff --git
>> > > a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>> > > b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>> > [..]
>> > >  - qcom,num-strings
>> > >  	Usage:        optional
>> > >  	Value type:   <u32>
>> > >  	Definition:   #; number of led strings attached;
>> > > -		      value from 1 to 3. default: 2
>> > > -		      This property is supported only for PM8941.
>> > > +		      value: For PM8941 from 1 to 3.
>> > > +			     For PMI8998 from 1 to 4.
>> > [..]
>> > > +- qcom,enabled-strings
>> > > +	Usage:        optional
>> > > +	Value tyoe:   <u32 array>
>> > > +	Definition:   Array of the WLED strings numbered from 0 to 3. Each
>> > > +		      string of leds are operated individually. Specify the
>> > > +		      list of strings used by the device. Any combination of
>> > > +		      led strings can be used.
>> > [..]
>> > >
>> > >  Example:
>> > >
>> > > @@ -99,4 +146,5 @@ pm8941-wled@d800 {
>> > >  	qcom,switching-freq = <1600>;
>> > >  	qcom,ovp = <29>;
>> > >  	qcom,num-strings = <2>;
>> > > +	qcom,enabled-strings = <0x00 0x01>;
>> >
>> > Nit. I would assume that specifying qcom,num-strings = <2> implies that
>> > the first 2 strings are used, so one would not also specify
>> > qcom,enabled-strings.
>> >
>> Thanks Bjorn for reviewing the series !
>> 
>> "qcom,enabled-strings" need be specified along with the 
>> "qcom,num-strings".
>> Because the enabled-strings can be <0, 2> or <0, 3 > also. The driver 
>> picks
>> the string
>> configuration from the enabled-strings array and enable only those
>> current-sinks.
>> 
> 
> The original binding described qcom,num-strings to mean "the first N
> strings", requiring qcom,enabled-strings now would break backwards
> compatibility with this binding.
> 
> In the case that qcom,enabled-strings is specified we can easily derive
> num-strings from the listed entires. So I would suggest that you look
> for enabled-strings and if not found fall back to checking for
> num-strings.
> 
> Regards,
> Bjorn

Sorry for the late reply. Actually the "qcom,enabled-strings" is 
initialized with
the strings 0, 1, 2, 3 in the driver. Even though this property is 
missing the first
N strings will be still configured with out any issue, based on the 
"qcom,num-strings".
