    /// <summary>
    ///   Sparse Linear Support Vector Machine (SVM)
    /// </summary>
    public class SupportVectorMachine
    {

        private int inputCount;
        private double[][] supportVectors;
        private double[] weights;
        private double threshold;

        /// <summary>
        ///   Creates a new Support Vector Machine
        /// </summary>
        public SupportVectorMachine(int inputs)
        {
            this.inputCount = inputs;
        }

        /// <summary>
        ///   Gets the number of inputs accepted by this SVM.
        /// </summary>
        public int Inputs
        {
            get { return inputCount; }
        }

        /// <summary>
        ///   Gets or sets the collection of support vectors used by this machine.
        /// </summary>
        public double[][] SupportVectors
        {
            get { return supportVectors; }
            set { supportVectors = value; }
        }

        /// <summary>
        ///   Gets or sets the collection of weights used by this machine.
        /// </summary>
        public double[] Weights
        {
            get { return weights; }
            set { weights = value; }
        }

        /// <summary>
        ///   Gets or sets the threshold (bias) term for this machine.
        /// </summary>
        public double Threshold
        {
            get { return threshold; }
            set { threshold = value; }
        }

        /// <summary>
        ///   Computes the given input to produce the corresponding output.
        /// </summary>
        /// <param name="input">An input vector.</param>
        /// <returns>The ouput for the given input.</returns>
        public virtual double Compute(double[] input)
        {
            double s = threshold;
            for (int i = 0; i < supportVectors.Length; i++)
            {
                double p = 0;
                for (int j = 0; j < input.Length; j++)
                    p += supportVectors[i][j] * input[j];

                s += weights[i] * p;
            }

            return s;
        }

        /// <summary>
        ///   Computes the given inputs to produce the corresponding outputs.
        /// </summary>
        public double[] Compute(double[][] inputs)
        {
            double[] outputs = new double[inputs.Length];

            for (int i = 0; i < inputs.Length; i++)
                outputs[i] = Compute(inputs[i]);

            return outputs;
        }

    }
