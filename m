From: kgunda@codeaurora.org
Subject: Re: [PATCH V3 3/7] backlight: qcom-wled: Add new properties for
 PMI8998
Date: Thu, 21 Jun 2018 10:44:14 +0530
Message-ID: <7bec89f5f5a47d98633e23cc37543c67@codeaurora.org>
References: <1529406822-15379-1-git-send-email-kgunda@codeaurora.org>
 <1529406822-15379-4-git-send-email-kgunda@codeaurora.org>
 <20180620190502.GA20160@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0032601356=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180620190502.GA20160@rob-hp-laptop>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, b.zolnierkie@samsung.com, jingoohan1@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-arm-msm@vger.kernel.org, lee.jones@linaro.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

--===============0032601356==
Content-Type: multipart/alternative;
 boundary="=_242f2ed161315ae9400ab60c18010112"

--=_242f2ed161315ae9400ab60c18010112
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On 2018-06-21 00:35, Rob Herring wrote: 

> On Tue, Jun 19, 2018 at 04:43:38PM +0530, Kiran Gunda wrote: 
> 
>> Update the bindings with the new properties used for
>> PMI8998.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>> .../bindings/leds/backlight/qcom-wled.txt          | 84 ++++++++++++++++++++--
>> 1 file changed, 77 insertions(+), 7 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>> index 14f28f2..503ce87 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>> @@ -48,11 +48,15 @@ platforms. The PMIC is connected to the host processor via SPMI bus.
>> - qcom,current-limit
>> Usage:        optional
>> Value type:   <u32>
>> -    Definition:   mA; per-string current limit
>> -              value: For pm8941: from 0 to 25 with 5 mA step
>> -                 Default 20 mA.
>> -                 For pmi8998: from 0 to 30 with 5 mA step
>> -                 Default 25 mA.
>> +    Definition:   mA; per-string current limit; value from 0 to 25 with
>> +              1 mA step. Default 20 mA.
>> +              This property is supported only for pm8941.
>> +
>> +- qcom,current-limit-microamp
>> +    Usage:        optional
>> +    Value type:   <u32>
>> +    Definition:   uA; per-string current limit; value from 0 to 30000 with
>> +              2500 uA step. Default 25000 uA.
> 
> This doesn't really seem worth adding just to add '-microamp'.
> Thanks for reviewing it!. I added this because the step value for PM8941(WLED3) and PMI8998(WLED4)

> are different. for WLED3 the step is 5mA and for WLED4 the step is 2.5mA. To mantain

> the backward compatibility i have added the new property with out modifying the existing

> one (qcom,current-limit).
> 
>> - qcom,current-boost-limit
>> Usage:        optional
>> @@ -79,12 +83,61 @@ platforms. The PMIC is connected to the host processor via SPMI bus.
>> 27, 29, 32, 35. default: 29V
>> This property is supported only for PM8941.
>> 
>> +- qcom,ovp-millivolt
> 
> Is this the same as qcom,ovp? If so, same comment.

> Yes. It is same. WLED3 has the OVP values 27V, 29V, 32V, 35V, where as

> WELD4 has 18.1V, 19.6V, 29.6V, 31.1V.
> 
>> +    Usage:        optional
>> +    Value type:   <u32>
>> +    Definition:   mV; Over-voltage protection limit;
>> +              For pmi8998: one of 18100, 19600, 29600, 31100
>> +              Default: 29600 mV
>> +              If this property is not specified for PM8941, it
>> +              falls back to "qcom,ovp" property.
>> +
>> - qcom,num-strings
>> Usage:        optional
>> Value type:   <u32>
>> Definition:   #; number of led strings attached;
>> -              value from 1 to 3. default: 2
>> -              This property is supported only for PM8941.
>> +              value: For PM8941 from 1 to 3. default: 2
>> +                 For PMI8998 from 1 to 4. default: 4
>> +
>> +- interrupts
>> +    Usage:        optional
>> +    Value type:   <prop encoded array>
>> +    Definition:   Interrupts associated with WLED. This should be
>> +              "short" and "ovp" interrupts. Interrupts can be
>> +              specified as per the encoding listed under
>> +              Documentation/devicetree/bindings/spmi/
>> +              qcom,spmi-pmic-arb.txt.
>> +
>> +- interrupt-names
>> +    Usage:        optional
>> +    Value type:   <string>
>> +    Definition:   Interrupt names associated with the interrupts.
>> +              Must be "short" and "ovp". The short circuit detection
>> +              is not supported for PM8941.
>> +
>> +- qcom,enabled-strings
>> +    Usage:        optional
>> +    Value tyoe:   <u32 array>
>> +    Definition:   Array of the WLED strings numbered from 0 to 3. Each
>> +              string of leds are operated individually. Specify the
>> +              list of strings used by the device. Any combination of
>> +              led strings can be used.
>> +              for pm8941: Default values are [00 01].
>> +              for pmi8998: Default values are [00 01 02 03].
> 
> u32 or u8 because dts syntax for 8-bit array is [].

> It is u32. I will correct dts syntax in next series as <0x00 0x01 0x02 0x03>,

> which is mentioned in the example.

+
+- qcom,external-pfet
+    Usage:        optional
+    Value type:   <bool>
+    Definition:   Specify if external PFET control for short circuit
+              protection is used. This property is supported only
+              for PMI8998.
+
+- qcom,auto-string-detection
+    Usage:        optional
+    Value type:   <bool>
+    Definition:   Enables auto-detection of the WLED string
configuration.
+              This feature is not supported for PM8941.
+

 Example:

@@ -99,4 +152,21 @@ pm8941-wled@d800 {
     qcom,switching-freq = <1600>;
     qcom,ovp = <29>;
     qcom,num-strings = <2>;
+    qcom,enabled-strings = <0x00 0x01>;
+};
+
+pmi8998-wled@d800 {
led-controller {

And needs a unit-address. 
Ok. Will modify as per your suggestion in the next series.

+    compatible = "qcom,pmi8998-wled";
+    reg = <0xd800 0xd900>;
+    label = "backlight";
+
+    interrupts = <3 0xd8 2 IRQ_TYPE_EDGE_RISING>,
+             <3 0xd8 1 IRQ_TYPE_EDGE_RISING>;
+    interrupt-names = "short", "ovp";
+    qcom,current-limit-microamp = <25000>;
+    qcom,current-boost-limit = <805>;
+    qcom,switching-freq = <1600>;
+    qcom,ovp-millivolt = <29600>;
+    qcom,num-strings = <4>;
+    qcom,enabled-strings = <0x00 0x01 0x02 0x03>;
 };
--
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
Forum,
 a Linux Foundation Collaborative Project
--=_242f2ed161315ae9400ab60c18010112
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt; font-family: Verdana,Gen=
eva,sans-serif'>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
On 2018-06-21 00:35, Rob Herring wrote:
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">On Tue, Jun 19, 2018 at 04:43:38PM +0530, Kiran Gunda =
wrote:
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">Update the bindings with the new properties used for<b=
r /> PMI8998.<br /> <br /> Signed-off-by: Kiran Gunda &lt;<a href=3D"mailto=
:kgunda@codeaurora.org">kgunda@codeaurora.org</a>&gt;<br /> ---<br /> &nbsp=
;.../bindings/leds/backlight/qcom-wled.txt &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;| 84 ++++++++++++++++++++--<br /> &nbsp;1 file change=
d, 77 insertions(+), 7 deletions(-)<br /> <br /> diff --git a/Documentation=
/devicetree/bindings/leds/backlight/qcom-wled.txt b/Documentation/devicetre=
e/bindings/leds/backlight/qcom-wled.txt<br /> index 14f28f2..503ce87 100644=
<br /> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt=
<br /> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt=
<br /> @@ -48,11 +48,15 @@ platforms. The PMIC is connected to the host pro=
cessor via SPMI bus.<br /> &nbsp;- qcom,current-limit<br /> &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;Usage: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;optional<br=
 /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value type: &nbsp;&nbsp;&lt;u32&gt;<br />=
 - &nbsp;&nbsp;&nbsp;Definition: &nbsp;&nbsp;mA; per-string current limit<b=
r /> - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;value: For pm8941: from 0 to 25 with 5 mA step<br /> - &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;Default 20 mA.<br /> - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For pmi8998: from 0 =
to 30 with 5 mA step<br /> - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Default 25 mA.<br /> + &n=
bsp;&nbsp;&nbsp;Definition: &nbsp;&nbsp;mA; per-string current limit; value=
 from 0 to 25 with<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1 mA step. Default 20 mA.<br /> + &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This pro=
perty is supported only for pm8941.<br /> +<br /> +- qcom,current-limit-mic=
roamp<br /> + &nbsp;&nbsp;&nbsp;Usage: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;optional<br /> + &nbsp;&nbsp;&nbsp;Value type: &nbsp;&nbsp;&lt;u32&gt=
;<br /> + &nbsp;&nbsp;&nbsp;Definition: &nbsp;&nbsp;uA; per-string current =
limit; value from 0 to 30000 with<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2500 uA step. Default 25000 uA=
=2E</blockquote>
<br /> This doesn't really seem worth adding just to add '-microamp'.<br />=
Thanks for reviewing it!. I added this because the step value for PM8941(WL=
ED3) and PMI8998(WLED4)</blockquote>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">are different. for WLED3 the step is 5mA and for WLED4=
 the step is 2.5mA. To mantain</blockquote>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">the backward compatibility i have added the new proper=
ty with out modifying the existing</blockquote>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">one (qcom,current-limit).<br /> <br />
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">&nbsp;- qcom,current-boost-limit<br /> &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;Usage: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;optional<br=
 /> @@ -79,12 +83,61 @@ platforms. The PMIC is connected to the host proces=
sor via SPMI bus.<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;27, 29, 32, 35. default: 29V<br /> &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;This property is supported only for PM8941.<br /> <br /> +- q=
com,ovp-millivolt</blockquote>
<br /> Is this the same as qcom,ovp? If so, same comment.</blockquote>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">Yes. It is same. WLED3 has the OVP values&nbsp;<span>2=
7V, 29V, 32V, 35V, where as</span></blockquote>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">WELD4 has&nbsp;<span>18.1V, 19.6V, 29.6V, 31.1V.</span=
><br /> <br />
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">+ &nbsp;&nbsp;&nbsp;Usage: &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;optional<br /> + &nbsp;&nbsp;&nbsp;Value type: &nbsp;&nbsp;&=
lt;u32&gt;<br /> + &nbsp;&nbsp;&nbsp;Definition: &nbsp;&nbsp;mV; Over-volta=
ge protection limit;<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For pmi8998: one of 18100, 19600, 29600, 31=
100<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;Default: 29600 mV<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If this property is not specifi=
ed for PM8941, it<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;falls back to "qcom,ovp" property.<br /> +<br =
/> &nbsp;- qcom,num-strings<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Usage: &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;optional<br /> &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;Value type: &nbsp;&nbsp;&lt;u32&gt;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;Definition: &nbsp;&nbsp;#; number of led strings attached;<br /> - &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
value from 1 to 3. default: 2<br /> - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This property is supported only fo=
r PM8941.<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;value: For PM8941 from 1 to 3. default: 2<br /> + &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;For PMI8998 from 1 to 4. default: 4<br /> +<br /> +- inter=
rupts<br /> + &nbsp;&nbsp;&nbsp;Usage: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;optional<br /> + &nbsp;&nbsp;&nbsp;Value type: &nbsp;&nbsp;&lt;prop e=
ncoded array&gt;<br /> + &nbsp;&nbsp;&nbsp;Definition: &nbsp;&nbsp;Interrup=
ts associated with WLED. This should be<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"short" and "ovp" interr=
upts. Interrupts can be<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;specified as per the encoding listed und=
er<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;Documentation/devicetree/bindings/spmi/<br /> + &nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;qcom,spmi-=
pmic-arb.txt.<br /> +<br /> +- interrupt-names<br /> + &nbsp;&nbsp;&nbsp;Us=
age: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;optional<br /> + &nbsp;&nbsp=
;&nbsp;Value type: &nbsp;&nbsp;&lt;string&gt;<br /> + &nbsp;&nbsp;&nbsp;Def=
inition: &nbsp;&nbsp;Interrupt names associated with the interrupts.<br /> =
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;Must be "short" and "ovp". The short circuit detection<br /> + &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;is n=
ot supported for PM8941.<br /> +<br /> +- qcom,enabled-strings<br /> + &nbs=
p;&nbsp;&nbsp;Usage: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;optional<br =
/> + &nbsp;&nbsp;&nbsp;Value tyoe: &nbsp;&nbsp;&lt;u32 array&gt;<br /> + &n=
bsp;&nbsp;&nbsp;Definition: &nbsp;&nbsp;Array of the WLED strings numbered =
from 0 to 3. Each<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string of leds are operated individually. Spec=
ify the<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;list of strings used by the device. Any combination of<b=
r /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;led strings can be used.<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for pm8941: Default values ar=
e [00 01].<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;for pmi8998: Default values are [00 01 02 03].</block=
quote>
<br /> u32 or u8 because dts syntax for 8-bit array is [].</blockquote>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">It is u32. I will correct dts syntax in next series as=
 &lt;0x00 0x01 0x02 0x03&gt;,</blockquote>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">which is mentioned in the example.</blockquote>
<br />+<br /> +- qcom,external-pfet<br /> + &nbsp;&nbsp;&nbsp;Usage: &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;optional<br /> + &nbsp;&nbsp;&nbsp;Valu=
e type: &nbsp;&nbsp;&lt;bool&gt;<br /> + &nbsp;&nbsp;&nbsp;Definition: &nbs=
p;&nbsp;Specify if external PFET control for short circuit<br /> + &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prote=
ction is used. This property is supported only<br /> + &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for PMI8998.<br /=
> +<br /> +- qcom,auto-string-detection<br /> + &nbsp;&nbsp;&nbsp;Usage: &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;optional<br /> + &nbsp;&nbsp;&nbsp;=
Value type: &nbsp;&nbsp;&lt;bool&gt;<br /> + &nbsp;&nbsp;&nbsp;Definition: =
&nbsp;&nbsp;Enables auto-detection of the WLED string configuration.<br /> =
+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;This feature is not supported for PM8941.<br /> +<br /> <br /> &nbsp;E=
xample:<br /> <br /> @@ -99,4 +152,21 @@ <a href=3D"mailto:pm8941-wled@d800=
">pm8941-wled@d800</a> {<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;qcom,switching=
-freq =3D &lt;1600&gt;;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;qcom,ovp =3D &l=
t;29&gt;;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;qcom,num-strings =3D &lt;2&gt=
;;<br /> + &nbsp;&nbsp;&nbsp;qcom,enabled-strings =3D &lt;0x00 0x01&gt;;<br=
 /> +};<br /> +<br /> <a href=3D"mailto:+pmi8998-wled@d800">+pmi8998-wled@d=
800</a> {<br /> led-controller {<br /> <br /> And needs a unit-address.</di=
v>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Ok. Will modify as per your suggestion in the next series.<br /> <br />+ &n=
bsp;&nbsp;&nbsp;compatible =3D "qcom,pmi8998-wled";<br /> + &nbsp;&nbsp;&nb=
sp;reg =3D &lt;0xd800 0xd900&gt;;<br /> + &nbsp;&nbsp;&nbsp;label =3D "back=
light";<br /> +<br /> + &nbsp;&nbsp;&nbsp;interrupts =3D &lt;3 0xd8 2 IRQ_T=
YPE_EDGE_RISING&gt;,<br /> + &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&lt;3 0xd8 1 IRQ_TYPE_EDGE_RISING&gt;;<br /> + &n=
bsp;&nbsp;&nbsp;interrupt-names =3D "short", "ovp";<br /> + &nbsp;&nbsp;&nb=
sp;qcom,current-limit-microamp =3D &lt;25000&gt;;<br /> + &nbsp;&nbsp;&nbsp=
;qcom,current-boost-limit =3D &lt;805&gt;;<br /> + &nbsp;&nbsp;&nbsp;qcom,s=
witching-freq =3D &lt;1600&gt;;<br /> + &nbsp;&nbsp;&nbsp;qcom,ovp-millivol=
t =3D &lt;29600&gt;;<br /> + &nbsp;&nbsp;&nbsp;qcom,num-strings =3D &lt;4&g=
t;;<br /> + &nbsp;&nbsp;&nbsp;qcom,enabled-strings =3D &lt;0x00 0x01 0x02 0=
x03&gt;;<br /> &nbsp;};<br /> --<br /> The Qualcomm Innovation Center, Inc=
=2E is a member of the Code Aurora Forum,<br /> &nbsp;a Linux Foundation Co=
llaborative Project<br /> </div>
</body></html>

--=_242f2ed161315ae9400ab60c18010112--

--===============0032601356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0032601356==--
